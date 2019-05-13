class Order < ApplicationRecord
  enum status: [:requested, :pending, :placed, :recieved_and_invoiced]
  
  has_many :order_users
  has_many :users, through: :order_users
  has_many :line_items
  has_many :notes
  
  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
end
