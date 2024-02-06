# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(keys: %i[email postal_code address profile])
  end
end
