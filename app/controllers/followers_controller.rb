# frozen_string_literal: true

class FollowersController  < ApplicationController
  def show
    @title = FollowRelationship.human_attribute_name(:followers)
    @user = User.find(params[:user_id])
    @users = @user.followers.order(:id).page(params[:page])
    render 'users/show_follow'
  end
end
