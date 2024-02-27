# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = FollowRelationship.human_attribute_name(:following)
    @user = User.find(params[:id])
    @users = @user.followings.order(:id).page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = FollowRelationship.human_attribute_name(:followers)
    @user = User.find(params[:id])
    @users = @user.followers.order(:id).page(params[:page])
    render 'show_follow'
  end
end
