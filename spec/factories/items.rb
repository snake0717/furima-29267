FactoryBot.define do
  factory :item do
    name                { 'テスト商品' }
    explanation         { 'テスト商品の説明' }
    category_id         { '1' }
    status_id           { '1' }
    shipping_charge_id  { '1' }
    shipping_region_id  { '1' }
    shipping_day_id     { '1' }
    selling_price       { '500' }
  end
end
