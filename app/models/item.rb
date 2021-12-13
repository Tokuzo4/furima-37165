class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status_id
  belongs_to :postage_id
  belongs_to :shipping_area_id
  belongs_to :days_to_ship_id
  validates :title, :text, presence: true
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
  def was_attached?
    image.attached?
  end

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, presence: true
  validates :price, presence: true
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :users, presence: true
end