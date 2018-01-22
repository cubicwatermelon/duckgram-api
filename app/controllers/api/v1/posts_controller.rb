class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[index]
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = current_user.posts
    end

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if current_user.posts.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:picture, :description, :user_id)
    end
end
