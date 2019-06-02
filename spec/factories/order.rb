FactoryBot.define do
  factory :order do
    after(:build) do |order|
      line_item = build(:line_item)
      order.line_items << line_item
      order.requestor = create(:user)
      order.save
    end
  end
end