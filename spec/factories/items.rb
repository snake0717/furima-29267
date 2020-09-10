FactoryBot.define do
  factory :item do
    name                { 'テスト商品' }
    explanation         { 'テスト商品の説明' }
    category_id         { '2' }
    status_id           { '2' }
    shipping_charge_id  { '2' }
    shipping_region_id  { '2' }
    shipping_day_id     { '2' }
    selling_price       { '500' }
    association :user
  end
end
