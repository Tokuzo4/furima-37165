class Order < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true
end
