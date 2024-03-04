# frozen_string_literal: true

class FollowingsController < ApplicationController
  def show
    @title = FollowRelationship.human_attribute_name(:following)
    @user = User.find(params[:user_id])
    @users = @user.followings.order(:id).page(params[:page])
    render 'users/show_follow'
  end
end
