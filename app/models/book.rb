class Book < ApplicationRecord
  has_many :authors#, inverse_of: :book
  accepts_nested_attributes_for :authors#, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :name
end
