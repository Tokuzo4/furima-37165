class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :chome_address, :building_name, :telephone_number

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, chome_address: chome_address, building_name: building_name, donation_id: donation.id)
  end
end