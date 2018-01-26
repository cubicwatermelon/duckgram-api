class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar
  attribute :followers
  attribute :following
  attribute :posts

  def followers
    object.followers.count
  end

  def following
    object.following.count
  end

  def posts
    object.posts.count
  end
end
