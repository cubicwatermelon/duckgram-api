class PostSerializer < ActiveModel::Serializer
  attributes :id, :picture, :description, :created_at
  attribute :likes
  attribute :liked
  has_one :user

  def likes
    object.likes.count
  end

  def liked
    object.likees.include?(@instance_options[:scope])
  end
end
