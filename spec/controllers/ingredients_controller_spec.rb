# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  let(:ingredient_mock) { FactoryBot.attributes_for(:ingredient_mock) }
  let(:put_data) { FactoryBot.attributes_for(:put_data) }
  let(:valid_params) { FactoryBot.attributes_for(:id_params) }
  let(:ingredient) { double(:Ingredient, ingredient_mock) }

  describe '#update' do
    context 'when request params are valid' do
      before do
        allow(controller).to receive(:retrieve_and_validate_put).and_return(ingredient)
        allow(ingredient).to receive(:update!).and_return(true)
      end
      it 'updates the ingredient units' do
        put :update, params: put_data
        expect(response.status).to eq 204
      end
    end

    context 'when update! method raises error' do
      before do
        allow(controller).to receive(:retrieve_and_validate_put).and_return(ingredient)
        allow(ingredient).to receive(:update!).and_raise(ActiveRecord::RecordInvalid)
      end
      it 'returns 400 error' do
        put :update, params: put_data
        expect(response.status).to eq 400
      end
    end
  end

  describe '#index' do
    subject { get :index, params: {} }

    before do
      allow(Ingredient).to \
        receive(:all).and_return([ingredient])
    end

    context 'when request params are valid' do
      it 'returns list of ingredients' do
        subject
        expect(response.status).to eq 200
        response_body = JSON.parse(response.body)
        expect(response_body['total_results']).to eq(1)
      end
    end
  end

  describe '#show' do
    context 'when request params are valid' do
      before do
        allow(Ingredient).to \
          receive(:find_by!)
          .and_return(ingredient)
      end
      it 'returns ingredient item' do
        get :show, params: valid_params
        expect(response.status).to eq 200
      end
    end
    context 'when show! method raises error' do
      before do
        allow(Ingredient).to \
          receive(:find_by!)
          .and_return(ingredient)
        allow(ingredient).to receive(:as_json).and_raise(ActiveRecord::RecordNotFound)
      end
      it 'returns 404 error' do
        get :show, params: valid_params
        expect(response.status).to eq 404
      end
    end
  end

  describe '#retrieve_and_validate_put' do
    subject { controller.send(:retrieve_and_validate_put) }

    before do
      allow(Ingredient).to \
        receive(:find_by!)
        .and_return(ingredient)
    end

    context 'when unit is same' do
      before do
        allow(controller).to receive(:params).and_return(put_data)
        allow(Ingredient).to \
          receive(:find_by).with(name: ingredient.id, quantity: ingredient.quantity)
                           .and_return('true')
      end

      it 'returns ingredient object' do
        is_expected.to eq(ingredient)
      end
    end
  end
end