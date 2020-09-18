class Address < ApplicationRecord
  belongs_to :purchase
  before_validation :delete_hyphen


  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :shipping_origin_id, numericality: { other_than: 1 , message:'Select'}
    validates :city
    validates :block_num
    validates :phone_num

  end

  private
    def delete_hyphen
      self.phone_num = phone_num.gsub(/-/,'')
    end
end
