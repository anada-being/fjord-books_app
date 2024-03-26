# frozen_string_literal: true

class FollowingsController < ApplicationController
  def show
    @title = t('followrelationship.followings')
    @user = User.find(params[:user_id])
    @users = @user.followings.with_attached_avatar.order(:id).page(params[:page])
    render 'users/show_follow'
  end
end
