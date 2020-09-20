class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_leadtime
  has_one_attached :image
  belongs_to :user
  has_one :purchase

  # 空の投稿を保存できないようにする, # 選択が「---」のままになっていないか
  with_options presence: true do
    validates :image
    validates :item_name
    validates :detail
    validates :category_id, numericality: { other_than: 1 , message:'Select'}
    validates :item_condition_id, numericality: { other_than: 1 , message:'Select'}
    validates :delivery_fee_id, numericality: { other_than: 1 , message:'Select'}
    validates :shipping_origin_id, numericality: { other_than: 1 , message:'Select'}
    validates :shipping_leadtime_id, numericality: { other_than: 1 , message:'Select'}
    validates :price, numericality: { greater_than: 299 , less_than: 10000000, message: 'Out of setting range'}
  end


  PRICE_REGEX = /\A[0-9\d]{3,7}+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'Half-width number'

end
