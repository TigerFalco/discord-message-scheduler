require 'bcrypt'

class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.permit(:username, :password))
    @user.password = BCrypt::Password.create(params[:password])
    if @user.save
      redirect_to '/user/home'
    else
      render 'new'
    end
  end

  def login_post
    if @user = User.where( username: params[:username]).first
      if BCrypt::Password.new(@user.password) == params[:password].to_s
        session[:user_id] = @user.id
        redirect_to '/user/home'
      else
        session[:user_id] = nil
        redirect_to '/user/login'
      end
    else
      session[:user_id] = nil
      redirect_to '/user/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/user/login'
  end

  def home
    if session[:user_id] == nil
      redirect_to '/user/login'
    else
      @user = User.find(session[:user_id])
    end
  end

end
