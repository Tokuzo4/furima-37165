class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :status
  belongs_to :category
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one :order_history
  has_many_attached :images

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: 'は1枚以上5枚以下にしてください' }
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "category can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "status can't be blank" }
  validates :postage_id, presence: true, numericality: { other_than: 1, message: "postage can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "prefecture can't be blank" }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1, message: "days_to_ship can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
