class Api::V1::RelationshipsController < ApplicationController
  def follow
    user = User.find(params[:id])
    current_user.follow(user)
    head :no_content
  end

  def unfollow
    user = Relationship.find_by(followed_id: params[:id]).followed
    current_user.unfollow(user)
    head :no_content
  end
end
