class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]

  
  def index
    
    @order = OrderAddress.new
  end

  def create
    
    @order = OrderAddress.new(order_params)

    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
   
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']    # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.selling_price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def order_params
    params.permit(:token, :postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :order_id, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
