class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(address_params)
    if @shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.permit(
      :postal_code, :shipping_region_id, :city, :address, :building_name,:phone_number, :order_id
    )
  end
  
end
