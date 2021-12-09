FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { 'a00000' }
    password_confirmation { password }
    nickname              { 'test' }
    last_name             { '嗚' }
    last_name_furigana    { 'ア' }
    first_name            { '嗚' }
    first_name_furigana   { 'ア' }
    birthday              { '2000-01-01' }
  end
end
