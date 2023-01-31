class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  accepts_nested_attributes_for :order_details
  
  def my_address
    '〒' + postal_code + ' ' + address + ' ' + name + ' '
  end
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
