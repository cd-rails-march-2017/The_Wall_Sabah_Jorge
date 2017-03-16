class UsersController < ApplicationController

  def login
    #User.find
  end
  def loginuser
    @user = User.find_by(email:params[:email])
    if @user
      session[:user] = @user
      session[:id] = @user.id
      redirect_to '/posts/index'
    else
      redirect_to '/users/login'
    end
  end

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    session[:user] = user
    session[:id] = user.id
    redirect_to '/posts/index'
  end

  def logout
    session[:user] = nil
    session[:id] = nil
    redirect_to '/users/login'
  end

  def destroy
  end
end
