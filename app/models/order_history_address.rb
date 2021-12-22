class OrderHistoryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :chome_address, :building_name, :telephone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :chome_address
    validates :telephone_number
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    @order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, chome_address: chome_address,
                   building_name: building_name, order_id: order.id)
  end
end
