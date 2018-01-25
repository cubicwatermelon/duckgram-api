class Api::V1::LikesController < ApplicationController
  def like
    post = Post.find(params[:id])
    if current_user.id != post.user.id
      begin
        current_user.like(user)
        render json: {status: 'Liked'}, status: :no_content
      rescue ActiveRecord::RecordNotUnique
        render json: {status: 'Already liked the post'}, status: :conflict
      end
    else
      render json: {status: 'An user cannot like its own post'}, status: :forbidden
    end
  end

  def dislike
    like = Like.find_by(post_id: params[:id])
    if like
      current_user.dislike(like.post)
      render json: {status: 'Like removed'}, status: :no_content
    else
      render json: {status: 'Like does not exists'}, status: :not_found
    end
  end
end
