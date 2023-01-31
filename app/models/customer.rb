class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def my_address
    '〒' + postal_code + ' ' + address + ' ' + last_name + ' ' + first_name
  end

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

end
