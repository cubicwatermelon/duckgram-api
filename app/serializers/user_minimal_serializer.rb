class UserMinimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar
end
