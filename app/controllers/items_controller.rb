class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Item.save(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id,
                                 :shipping_region_id, :shipping_day_id, :selling_price, ).
                                 merge(user_id: current_user.id)

  end
end
