class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    # @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

end
