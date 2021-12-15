class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :status
  belongs_to :category
  belongs_to :postage
  belongs_to :shipping_area
  belongs_to :days_to_ship
  has_one_attached :image

  validates :image, presence: true, unless: :was_attached?
  def was_attached?
    image.attached?
  end

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "category can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "status can't be blank" }
  validates :postage_id, presence: true, numericality: { other_than: 1, message: "postage can't be blank" }
  validates :shipping_area_id, presence: true, numericality: { other_than: 0, message: "shipping_area can't be blank" }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1, message: "days_to_ship can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
