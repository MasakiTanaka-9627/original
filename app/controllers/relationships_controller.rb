class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_back(fallback_location: root_path)
  end

  def following 
    @user = User.find(current_user.id)
    @follow = Relationship.where(following_id: current_user.id)
  end

  def follower
    @user = User.find(current_user.id)
    @follow = Relationship.where(follower_id: current_user.id)
  end

end
