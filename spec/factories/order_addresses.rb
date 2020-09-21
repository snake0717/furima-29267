FactoryBot.define do
  factory :order_address do
    token                 { 'token' }
    postal_code           { '661-4443' }
    shipping_region_id    { 2 }
    city                  { '名古屋市' }
    address               { '中区3' }
    building_name         { 'ビル' }
    phone_number          { '12355551234' }
  end
end
