class Item < ApplicationRecord
  class Item < ApplicationRecord
    belongs_to :users
    has_one_attached :image
  
    validates :content, presence: true, unless: :was_attached?
    def was_attached?
      self.image.attached?
    end
    
    validates :name, presence: true
    validates :explanation, presence: true
    validates :category_id, presence: true
    validates :status_id, presence: true
    validates :price, presence: true
    validates :postage_id, presence: true
    validates :shipping_area_id, presence: true
    validates :days_to_ship_id, presence: true
    validates :users, presence: true
  end
  
end