class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user, :item, :purchase_id, :postal_code, :shipping_origin_id, :city, :block_num, :apartment_name, :phone_num

  before_validation :delete_hyphen

  validates :token, presence: true

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :shipping_origin_id, numericality: { other_than: 1 , message:'Select'}
    validates :city
    validates :block_num
    validates :phone_num

  end


  def save
    # 購入情報を保存し、「purchase」という変数に入れている
    purchase = Purchase.create(user: user.id, item: item.id, token: token)
    # 住所の情報を保存
    Address.create(purchase_id: purchase.id, postal_code: postal_code, shipping_origin_id: shipping_origin.id, city: city, block_num: block_num, apartment_name: apartment_name, phone_num: phone_num)
  end

  private

    def delete_hyphen
      self.phone_num = phone_num.gsub(/-/,'')
    end

end