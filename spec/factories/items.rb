FactoryBot.define do
  factory :item do
    name                     { 'test' }
    explanation              { '説明文' }
    category_id              { 2 }
    scheduled_state_id       { 2 }
    shipping_charge_id       { 2 }
    prefecture_id            { 2 }
    scheduled_day_id         { 2 }
    price                    { 1000 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
