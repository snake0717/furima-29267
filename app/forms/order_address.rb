class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :item_id, :order_id, :user_id

  def save
    ShippingAddress.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, 
                           address: address, building_name: building_name, phone_number: phone_number, order_id: order_id)
    Order.create(item_id: item_id, user_id: user_id)
  end

end