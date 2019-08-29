class Order < ApplicationRecord
  enum status: [:requested, :pending, :placed, :recieved_and_invoiced]
  
  include OrdersHelper
  belongs_to :requestor, class_name: 'User'
  belongs_to :purchaser, class_name: 'User', optional: true
  
  has_many :order_users
  has_many :users, through: :order_users
  has_many :line_items, dependent: :destroy
  has_many :notes, as: :noteable
  
  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  
  scope :purchased, -> { self.where.not(purchaser_id: nil) }
  
  def total_price
    line_items.reduce(0) { |total, item| item.total + total}
  end
  
  def display_total
    readable_price(self.total_price)
  end
  
  def date_requested
    created_at.strftime('%m-%d-%Y')
  end
  
  def processing_step
    Order.statuses[self.status] + 1
  end
end
