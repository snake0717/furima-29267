class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @adress = Adress.new
  end

  def create
    @adress = Adress.new(adress_params)
    if @adress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def adress_params
    params.permit(
      :postal_code, :shipping_region_id, :city, :adress, :bulilding_name,:phone_number, :order_id
    )
  end
  
end
