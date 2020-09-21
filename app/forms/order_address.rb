class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :item_id, :order_id, :user_id

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

  with_options presence: true do
    validates :token

    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/	}

    validates :shipping_region_id, numericality: { other_than: 1 }

    validates :city

    validates :address

    validates :phone_number, format: { with: /\A[a-zA-Z0-9]+\z/ }
  end
end
