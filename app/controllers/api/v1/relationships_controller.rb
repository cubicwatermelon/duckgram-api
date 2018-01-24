class Api::V1::RelationshipsController < ApplicationController
  def follow
    user = User.find(params[:id])
    begin
      current_user.follow(user)
      head :no_content
    rescue ActiveRecord::RecordNotUnique
      head :conflict
    end
  end

  def unfollow
    relationship = Relationship.find_by(followed_id: params[:id])
    if relationship
      current_user.unfollow(relationship.followed)
      head :no_content
    else
      head :not_found
    end
  end
end
