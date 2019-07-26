class Note < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :noteable, polymorphic: true
end
