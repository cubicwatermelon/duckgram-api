class PostSerializer < ActiveModel::Serializer
  attributes :id, :picture, :description, :created_at
  attribute :likes
  has_one :user

  def likes
    object.likes.count
  end
end
