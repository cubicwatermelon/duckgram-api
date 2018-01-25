class Api::V1::RelationshipsController < ApplicationController
  def follow
    user = User.find(params[:id])
    begin
      current_user.follow(user)
      head :no_content
    rescue ActiveRecord::RecordNotUnique
      render json: {status: 'Already following'}, status: :conflict
    end
  end

  def unfollow
    relationship = Relationship.find_by(followed_id: params[:id])
    if relationship
      current_user.unfollow(relationship.followed)
      head :no_content
    else
      render json: {status: 'Relationship does not exists'}, status: :not_found
    end
  end
end
