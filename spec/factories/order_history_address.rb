FactoryBot.define do
  factory :order_history_address do
    token                 { 'tok_aaaaaaaaaa00000000000000000' }
    postal_cord           { '111-1111' }
    prefectures_id        { 1 }
    municipalities        { '岡山市北区' }
    house_number          { '蕃山町1-1' }
    building_name         { '岡山ビル' }
    telephone_number      { '09012345678' }
    association :user, :item
  end
end