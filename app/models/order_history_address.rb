class OrderHistoryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :chome_address, :building_name, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :chome_address
    VALID_TELEPHONE_NUMBER_REGEX = /\A\d{10,11}\z/
    validates :telephone_number, format: { with: VALID_TELEPHONE_NUMBER_REGEX, message: 'は半角数値で記述する必要があります' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end
  def save
    order_history = OrderHistory.create(user_id: user_id, item_id: item_id, token: token)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, chome_address: chome_address,
                   building_name: building_name, order_history_id: order_history.id)
  end
end
