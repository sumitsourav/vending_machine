# frozen_string_literal: true

# Internal: The class for creating the data access object on beverages table in the database.
class Beverage < ApplicationRecord
  validates :name, presence: true, length: { maximum: 36 }
  validates_uniqueness_of :name, case_sensitive: false
end
