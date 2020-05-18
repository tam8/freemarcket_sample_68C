class Address < ApplicationRecord
  # class CreateAddresses < ActiveRecord::Migration[5.2]
    belongs_to :user, optional: true
    validates :zipcode, :city_name, :city_number, :owners_area_id, presence: true
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :owners_area
  # end 
end 