class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  attribute :followers
  attribute :following

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
