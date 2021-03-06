require 'rails_helper'

RSpec.describe BeverageRecipe, type: :model do
  let(:validations) { %i[quantity] }

  describe 'Beverage Recipe model validations' do
    context 'validate presence of mandatory keys' do
      it 'validates presence of mandatory fields' do
        validations.each do |key|
          should validate_presence_of key
        end
      end
    end
  end
end
