class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post)   
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: "Post deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = User.posts.find(params[:post_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
