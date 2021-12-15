FactoryBot.define do
  factory :item do
    name {"お菓子"}
    explanation {"ラムネ"}
    category_id {2}
    status_id {2}
    shipping_area_id {2}
    days_to_ship_id {2}
    postage_id {2}
    price {"1000"}
    association :user

    after(:build) do|item|
      item.image.attach(io:File.open("public/images/image.jpg"),filename:"image.jpg")
  end
end
end