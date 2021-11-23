class CollectsController < ApplicationController

  def index
    @posts = current_user.collected_posts
  end

  def create
    if already_saved?
      flash[:notice] = "You can't collect a post more than once" 
    else 
      Collect.create(post_id: params["post_id"], user_id: current_user.id)
    end
    redirect_to post_path(params["post_id"])
  end

  def destroy
    collect = Collect.find(params["id"])
    post_id = collect.post_id

    collect.destroy
    redirect_to post_path(post_id)
  end

  private

    def already_saved?
      Collect.where(user_id: current_user.id, post_id:
      params[:post_id]).exists?
    end
  end