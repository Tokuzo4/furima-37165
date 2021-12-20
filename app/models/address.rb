class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postal_code
  belongs_to :prefecture
  belongs_to :city
  belongs_to :chome_address
  belongs_to :building_name
  belongs_to :telephone_number

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "prefecture can't be blank" }
  validates :city, presence: true
  validates :chome_address, presence: true
  validates :building_name, presence: true
  validates :telephone_number, presence: true
end
