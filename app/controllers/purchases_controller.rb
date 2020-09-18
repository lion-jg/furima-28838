class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_purchase, only: [:index, :sell_user]
  before_action :sell_user, only: [:index]

  def index
  end

  def new
    @purchase = PurchaseAddress.new   #「PurchaseAddress」に編集
  end
 
  def create
    @purchase = PurchaseAddress.new(purchase_params)   #「PurchaseAddress」に編集
    @purchase.save
  end



  private
 
  def purchase_params
   #「住所」「寄付金」のキーも追加
   params.require(:purchase_address).permit(:purchase_id, :postal_code, :shipping_origin_id, :city, :block_num, :apartment_name, :phone_num
).merge(user: current_user.id, item: item.id)
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def sell_user
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
