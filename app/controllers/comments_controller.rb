class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!, except: [:new]

  def new
    @comment = Comment.new
  end

  def create # on post or on comments
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      @post = Post.find_by_id(params[:comment][:post_id])
      redirect_to request.referrer, notice: 'Your comment was successfully posted!'
    else
      redirect_to request.referrer, notice: "Your comment wasn't posted!"
    end
  end

  def destroy #either on post or on comment
    if params[:post_id] && params[:id]
      post = Post.find_by(id: params[:post_id])
      comment = post.comments.find_by(id: params[:id])
      comment.destroy
      redirect_to post_path(post), notice: "Comment Succesfully deleted!"
    else
      comment = Comment.find_by(id: params[:comment_id])
      comment_reply = comment.comments.find_by(id: params[:id])
      comment_reply.destroy
      redirect_to request.referrer,notice: "Comment Succesfully deleted!"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    #Weather it is commented on comment or on post
    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end
