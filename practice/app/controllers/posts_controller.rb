class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post had been saved."
      redirect_to @post
    else
      flash[:error] = "Post could not be saved."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    if @post.save
      flash[:notice]="Post has been updated."
      redirect_to @post
    else
      flash[:error]="Post could not be updated."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice]="Post has been deleted."
      render :index
    else
      flash[:error]="Post could not be deleted."
      redirect_to @post
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
