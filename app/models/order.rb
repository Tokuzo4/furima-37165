class Order < ApplicationRecord
  attr_accessor :token
  
  validates :price, presence: true
  validates :name, presence: true
end
