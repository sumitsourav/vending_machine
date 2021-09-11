# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:name) { %i[name] }

  describe 'Ingredient model validations' do
    context 'validate presence of mandatory keys' do
      it 'validates presence of mandatory fields' do
        name.each do |key|
          should validate_presence_of key
        end
      end
    end

    context 'validate maximum allowed length' do
      it 'validates maximum allowed length for fields' do
        should validate_length_of(:name).is_at_most(36)
                                        .with_message('is too long (maximum is 36 characters)')
      end
    end
  end
end