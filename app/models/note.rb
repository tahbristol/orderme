class Note < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :noteable, polymorphic: true

  validates :content, length: { minimum: 1 }
end
