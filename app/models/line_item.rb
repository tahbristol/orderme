class LineItem < ApplicationRecord
  include OrdersHelper::PriceFormatter
  before_create :convert_price_to_cents
  
  belongs_to :order
  
  def total
    quantity * self.price
  end
  
  def display_price
    readable_price(self.price)
  end
  
  private
  
  def convert_price_to_cents
      self.price = Money.from_amount(self.price.to_d).cents
  end
end
