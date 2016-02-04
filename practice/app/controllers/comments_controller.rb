class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if comment.save
      flash[:notice]="Comment has been saved."
      redirect_to @comment
    else
      flash[:error]="Comment could not be saved."
      render :new
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.save
      flash[:notice]="Comment was saved successfully."
      redirect_to @comment
    else
      flash[:error]="Comment could not be saved."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment was deleted successfully."
      redirect_to @post
    else
      flash[:error] = "Comment failed to delete."
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
