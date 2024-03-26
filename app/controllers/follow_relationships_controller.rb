# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user_path(user.id)
  end

  def destroy
    user = User.find(params[:followed_id])
    current_user.unfollow(user)
    redirect_to user_path(user.id)
  end
end
