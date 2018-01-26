class LikeSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :post, serializer: PostMinimalSerializer
  belongs_to :user, serializer: UserMinimalSerializer
end
