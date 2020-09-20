class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :shipping_origin_id, :city, :block_num, :apartment_name, :phone_num, :token


  validates :token, presence: true

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :shipping_origin_id, numericality: { other_than: 1 , message:'Select'}
    validates :city
    validates :block_num
    validates :phone_num, format: { with: /\A[0-9]+\z/, message: 'Input correctly' }

  end


  def save
    # 購入情報を保存し、「purchase」という変数に入れている
    purchase = Purchase.create(user_id: user, item_id: item)
    # 住所の情報を保存
    Address.create(purchase_id: purchase.id, postal_code: postal_code, shipping_origin_id: shipping_origin_id, city: city, block_num: block_num, apartment_name: apartment_name, phone_num: phone_num)
  end

end