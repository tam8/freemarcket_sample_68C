class Address < ApplicationRecord
  class CreateAddresses < ActiveRecord::Migration[5.2]
    belongs_to :user, optional: true
    validates :zipcode, :address ,presence: true
end

