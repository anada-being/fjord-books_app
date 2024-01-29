class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def list
    @users = User.order(:id).page(params[:page])
    @users = @users.page(params[:page])
  end

  def user_params
    params.require(:user).permit(:show, keys:[:email, :postal_code, :address, :profile])
  end

end
