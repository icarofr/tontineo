class UserController < ApplicationController
  #   before_filter :initialize_user

  #   def index
  #     @users = User.all
  #   end

  #   def show
  #     @user = User.find(params[:id])

  #     redirect_to users_path if @user.nil?
  #   end

  #   def new
  #     @user = User.new

  #     redirect_to users_path if @user.nil?

  #     if current_user.nil?
  #       redirect_to users_path

  #     elsif current_user.admin?

  #       @user = User.new
  #     end
  #   end

  #   def create
  #     @user = User.new(user_params)
  #     if @user.save
  #       redirect_to users_path
  #     else
  #       render 'new'
  #     end
  #   end

  #   def edit
  #     @user = User.find(params[:id])
  #   end

  #   def update
  #     @user = User.find(params[:id])
  #     if @user.update(user_params)
  #       redirect_to users_path
  #     else
  #       render 'edit'
  #     end
  #   end

  #   def destroy
  #     @user = User.find(params[:id])

  #     @user.destroy
  #     redirect_to users_path
  #   end

  #   def initialize_user
  #     @user = User.new
  #   end
end
