class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :likees, through: :likes, source: :user
end
