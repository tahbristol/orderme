FactoryBot.define do
  factory :order do
    after(:build) do |order|
      last_user = User.last
      line_item = build(:line_item)
      order.line_items << line_item
      if last_user
        order.requestor = create(:user_2)
      else
        order.requestor = create(:user)
      end
      order.save
    end
  end
end