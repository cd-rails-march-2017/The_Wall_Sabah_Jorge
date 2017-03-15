class UsersController < ApplicationController

  def login
    #User.find
  end
  def loginuser
    @users = params[:email]
    render :text => "test"
  end

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    session[:id] = user.id
    redirect_to '/posts/index'
    end


  def destroy
  end
end
