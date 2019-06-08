class LineItem < ApplicationRecord
  include OrdersHelper::PriceFormatter
  before_save :convert_price_to_cents
  
  belongs_to :order
  
  def total
    quantity * Money.from_amount(self.price).cents
  end
  
  private
  
  def convert_price_to_cents
    self.price = Money.from_amount(self.price.to_d).cents
  end
end
