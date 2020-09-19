class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_purchase, only: [:index, :create, :sell_user]
  before_action :sell_user, only: [:index]

  def index
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)   #「PurchaseAddress」に編集
    if @purchase.valid?
      pay_item
      @purchase.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render "index"    # バリデーションに弾かれた時
    end
  end



  private
 
  def purchase_params
   params.require(:purchase_address).permit(:postal_code, :shipping_origin_id, :city, :block_num, :apartment_name, :phone_num).merge(user: current_user.id, item: params[:item_id], token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def sell_user
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
