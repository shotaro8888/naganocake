class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum product_status: { cannot: 0, wait: 1, now: 2, complete: 3 }
  
end
