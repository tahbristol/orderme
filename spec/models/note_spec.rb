require 'rails_helper'

RSpec.describe Note, type: :model do
  it "cannot be created without content" do
    order = create(:order)
    user = create(:user)
    note = Note.create(content: '', noteable: order, author_id: user.id)

    expect(note.valid?).to eq false
  end
end
