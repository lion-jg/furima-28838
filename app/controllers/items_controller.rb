class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :detail, :category_id, :item_condition_id, :delivery_fee_id, :shipping_origin_id, :shipping_leadtime_id, :price)
  end
end
