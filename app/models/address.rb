class Address < ApplicationRecord
  # class CreateAddresses < ActiveRecord::Migration[5.2]
    belongs_to :user, optional: true
    validates :zipcode, :address ,presence: true
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :owners_area
  # end
end 