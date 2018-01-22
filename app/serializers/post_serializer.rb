class PostSerializer < ActiveModel::Serializer
  attributes :id, :picture, :description
  has_one :user
end
