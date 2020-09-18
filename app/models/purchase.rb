class Purchase < ApplicationRecord
  belongs_to_active_hash :shipping_origin
  belongs_to :user
  belongs_to :item
  has_one :address
end