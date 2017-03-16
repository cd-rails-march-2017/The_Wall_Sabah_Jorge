class PostsController < ApplicationController
  def create
    @id = session[:id]
    #return render :text => @id.inspect
    Post.create(title: params[:title], content: params[:content], user:User.find(@id))
    redirect_to "/posts/index"
    #render :text => "test"
  end

  def index
    @posts = Post.all
    @comments = Comment.all
    @users = User.all

    #if !(session[:id])
    #  redirect_to 'users/login'
    #end
  end

  def message
    @post = Post.find(params[:id])
    Comment.create(message: params[:message], post:@post, user:User.find(session[:id]))
    redirect_to "/posts/index"
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/posts/index'
  end
end
