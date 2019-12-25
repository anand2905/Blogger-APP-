class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]



  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post = Post.find_by(id: params[:post_id])
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to root_path
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to root_path
  end



  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_like
   @post = Post.find_by(id: params[:post_id])
   @like = @post.likes.find(params[:id])
  end

end
