class PostSerializer < ActiveModel::Serializer
  attributes :id, :picture, :description, :created_at
  attribute :likes
  attribute :liked
  attribute :likees
  has_one :user

  def likes
    object.likes.count
  end

  def liked
    object.likees.include?(@instance_options[:scope])
  end

  def likees
    unless object.likes.empty?
      map = object.likes.map { |like| like.user.name }
      map.flatten.uniq
    else 
      []
    end
  end
end
