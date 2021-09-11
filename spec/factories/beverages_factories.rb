# frozen_string_literal: true

FactoryBot.define do
  factory :beverages_mock, class: Hash do
    id { SecureRandom.uuid }
    name { 'Tea' }
    recipe { '1' }
    created_at { Time.now.utc.to_s }
    updated_at { Time.now.utc.to_s }
  end

  factory :beverages_list_mock, class: Hash do
    items { [FactoryBot.attributes_for(:beverages_mock)] }
    totalResults { 1 }
  end

  factory :id_params, class: Hash do
    id { SecureRandom.uuid }
  end
end