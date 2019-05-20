class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  
  has_many :order_users
  has_many :orders, through: :order_users
  
  enum role: [:requestor, :purchaser]
  
  def purchased_orders
    orders.purchased
  end
end
