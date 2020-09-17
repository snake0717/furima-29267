class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderAddress.new
  end

  def create
    # @order = Order.new(order_params)
    # if @order.valid?
    #   pay_item
    #   @order.save
    #   return redirect_to root_path
    # else
    #   render 'index'
    # end
    @order = OrderAddress.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  # def order_params
  #   params.permit(:token)
  # end

  # def pay_item
  #   Payjp.api_key = sk_test_33df36ac188803b453e3364c  # PAY.JPテスト秘密鍵
  #   Payjp::Charge.create(
  #     amount: order_params[:price],  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency:'jpy'                 # 通貨の種類(日本円)
  #   )
  # end


  def order_params
    params.permit(:postal_code, :shipping_region_id, :city, :address, :building_name,:phone_number, :order_id, :item_id)
  end
  
end
