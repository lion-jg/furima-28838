class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_condition, :delivery_fee, :shipping_origin, :shipping_leadtime

  #空の投稿を保存できないようにする
  validates :image, :item_name, :detail, :category, :item_condition, :delivery_fee, :shipping_origin, :shipping_leadtime, :price, presence: true

  #選択が「---」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id, :item_condition_id, :delivery_fee_id, :shipping_origin_id, :shipping_leadtime_id
  end
end
