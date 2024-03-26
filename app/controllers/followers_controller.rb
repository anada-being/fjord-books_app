# frozen_string_literal: true

class FollowersController < ApplicationController
  def show
    @title = t('followrelationship.followers')
    @user = User.find(params[:user_id])
    @users = @user.followers.with_attached_avatar.order(:id).page(params[:page])
    render 'users/show_follow'
  end
end
