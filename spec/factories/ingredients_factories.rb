# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient_mock, class: Hash do
    id { SecureRandom.uuid }
    name { 'tea' }
    quantity { 10 }
    created_at { Time.now.utc.to_s }
    updated_at { Time.now.utc.to_s }
  end
  factory :post_params_mock, class: Hash do
    name { 'tea' }
    quantity { '10' }
  end
  factory :put_data, class: Hash do
    id { SecureRandom.uuid }
    quantity { 20 }
  end
end