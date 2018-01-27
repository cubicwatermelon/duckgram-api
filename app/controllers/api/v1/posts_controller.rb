class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :check_ownership, only: [:update, :destroy]

  # GET /posts
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts.order("created_at DESC")
    else
      @posts = Post.all.order("created_at DESC")
    end

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post, current_user: current_user
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      render json: @post, status: :created, current_user: current_user
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    if @post.destroy
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def check_ownership
      if current_user != @post.user
        head :forbidden
      end
    end

    def post_params
      params.require(:post).permit(:picture, :description)
    end
end
