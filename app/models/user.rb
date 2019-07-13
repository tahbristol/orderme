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
  
  has_one_attached :picture
  
  def purchased_orders
    Order.purchased.where(purchaser: self)
  end
end
