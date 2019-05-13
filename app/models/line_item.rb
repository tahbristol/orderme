class LineItem < ApplicationRecord
  
  belongs_to :order
  
  def total
    quantity * price.to_i
  end
end
