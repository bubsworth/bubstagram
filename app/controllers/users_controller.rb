class UsersController <ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:bio,:name, :email, :password, :password_confirmation, :username,  :pronouns, :image)
    end
    
    def set_user 
      @user = User.find_by(id: params[:id])
    end
end