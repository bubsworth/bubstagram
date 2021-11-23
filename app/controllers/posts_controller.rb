class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :destroy, :show, :update]

	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
    	@post.user = current_user

		if @post.save
			redirect_to posts_path, notice: "Posted!"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
		  redirect_to posts_path, notice: "Posted!"
		else
		  render :edit
		end
	end
	
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted" 
  end

	private

    def post_params
      params.require(:post).permit(:image, :caption, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
