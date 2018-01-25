class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[create]
  before_action :set_user, only: [ :show, :update, :destroy ]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # POST /users
  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: :created 
    else
      render json: @user.errors, status: :bad
    end 
  end

  # GET /users/1
  def show
    render json:    @user
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end  

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render json: @users
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render json: @users
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :avatar, :email, :password)
    end
end