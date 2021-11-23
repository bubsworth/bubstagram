class Users::RegistrationsController < Devise::RegistrationsController
  private
  # Notice the name of the method
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :image)
  end
end