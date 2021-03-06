class Like < ApplicationRecord
  belongs_to :post, class_name: "Post"
  belongs_to :user, class_name: "User"
  validates :post, presence: true
  validates :user, presence: true
end
