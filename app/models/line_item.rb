class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  validates :cart_id, presence: true
  validates :item_id, presence: true
end
