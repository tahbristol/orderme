FactoryBot.define do
  factory :line_item do
    name { "tips" }
    quantity { 1 }
    price { 100 }
    catalogue_number { "ABC" }
    vendor { "Tippers" }
  end
end