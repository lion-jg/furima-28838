class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_purchase, only: [:index, :sell_user]
  before_action :sell_user, only: [:index]

  def index
  end

  
  private

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def sell_user
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
