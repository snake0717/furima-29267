class ItemsController < ApplicationController
  def index
    @items = Item.all.order("updated_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id,
                                 :shipping_region_id, :shipping_day_id, :selling_price, :user_id).merge(user_id: current_user.id)
  end
end
