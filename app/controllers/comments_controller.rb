class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create
  end
  def create
    @post = Post.find(params[:post_id])   
    @comment = @post.comments.create(allowed_params)
    flash[:notice] = 'Comment Added'
    redirect_to post_path(@post)
  end

  private
  def allowed_params
    params.require(:comment).permit(:name, :email, :body, :post_id)
  end
end
