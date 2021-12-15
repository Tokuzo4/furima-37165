class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :users
  belongs_to :status
  belongs_to :postage
  belongs_to :shipping_area
  belongs_to :days_to_ship
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
  def was_attached?
    image.attached?
  end

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true
  validates :postage_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :users, presence: true
end
