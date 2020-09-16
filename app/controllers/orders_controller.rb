class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = Item.find(params[:item_id])
  end

  
end
