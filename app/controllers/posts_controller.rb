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
  end

  def message
    @post = Post.find(params[:id])
    Comment.create(message: params[:message], post:@post, user:@user)
    redirect_to "/posts/index"
  end

  def destroy
  end
end
