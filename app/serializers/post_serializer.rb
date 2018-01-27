class PostSerializer < ActiveModel::Serializer
  attributes :id, :picture, :description, :created_at
  attribute :likes
  attribute :liked
  attribute :likees
  has_one :user, serializer: UserMinimalSerializer

  def likes
    object.likes.count
  end

  def liked
    object.likees.include?(@instance_options[:scope])
  end

  def likees
    map = object.likees.map { |user| user&.name }
    map.flatten.uniq
  end
end
