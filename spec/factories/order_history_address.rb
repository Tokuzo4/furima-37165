FactoryBot.define do
  factory :order_history_address do
    token                 { 'tok_aaaaaaaaaa00000000000000000' }
    postal_code           { '111-1111' }
    prefecture_id         { 1 }
    city                  { '岡山市北区' }
    chome_address         { '蕃山町1-1' }
    building_name         { '岡山ビル' }
    telephone_number      { '09012345678' }
    association :user, :item
  end
end
