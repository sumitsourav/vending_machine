# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BeveragesController, type: :controller do
  let(:beverages_mock) { FactoryBot.attributes_for(:beverages_mock) }
  let(:beverage_response) { FactoryBot.attributes_for(:beverages_list_mock) }
  let(:params) { FactoryBot.attributes_for(:id_params) }
  let(:beverage) { double(:Beverage, beverages_mock) }

  describe '#show' do
    before do
      allow(Beverage).to receive(:find_by!).and_return(beverages_mock)
    end

    context 'when request params are valid' do
      it 'returns beverage item' do
        get :show, params: params
        expect(response.status).to eq 200
      end
    end
  end

  describe '#index'
  subject { get :index, params: {} }

  context 'when request params are valid' do
    before do
      allow(Beverage).to receive(:all).and_return(beverage_response[:items])
    end

    it 'returns beverage items' do
      subject
      expect(response.status).to eq 200
    end
  end
end