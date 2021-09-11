# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VendingTransactionsController, type: :controller do
  let(:beverages_mock) { FactoryBot.attributes_for(:beverages_mock) }
  let(:beverage_response) { FactoryBot.attributes_for(:beverages_list_mock) }
  let(:beverage) { double(:Beverage, beverages_mock) }
  let(:ingredient) { Ingredient.new(id: SecureRandom.uuid, name: 'tea', quantity: 10) }
  let(:ingredient_equal) { Ingredient.new(id: SecureRandom.uuid, name: 'tea', quantity: 1) }
  let(:ingredient_less) { Ingredient.new(id: SecureRandom.uuid, name: 'tea', quantity: 0) }
  let(:id) { SecureRandom.uuid }
  describe '#create' do
    context 'when request params are valid' do
      before do
        allow(Ingredient).to receive(:find_by!).and_return(ingredient)
        allow(Inventory).to receive(:get_recipe).and_return({})
      end

      it 'Successfully dispenses' do
        get :create, params: { beverage: 'BCS' }
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)['status']).to eq('Dispensed')
      end
    end

    context 'when request params are valid and equal to total ingredients' do
      before do
        allow(Ingredient).to receive(:find_by!).and_return(ingredient_equal)
        allow(Ingredient).to receive(:where).and_return([ingredient_equal])
        allow(ingredient).to receive(:update).and_return(true)
        allow(Inventory).to receive(:get_recipe).and_return({})
      end

      it 'successfully dispenses and throws the empty ingredients in the response' do
        get :create, params: { beverage: 'BCSL' }
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)['status']).to eq('Dispensed')
      end
    end
  end
end
