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
    # if @purchase.valid?
    #   @purchase.save  # バリデーションをクリアした時
    #   return redirect_to root_path
    # else
    #   render "index"    # バリデーションに弾かれた時
    # end
  end



  private
 
  def purchase_params
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
