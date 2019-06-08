module OrdersHelper
  module PriceFormatter
    def readable_price(price_in_cents)
      Money.new(price_in_cents, "USD").format
    end
  end
end
