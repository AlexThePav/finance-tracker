class FriendshipsController < ApplicationController

  def destroy
    @friend = User.find(params[:id])
    @friendship1 = current_user.friendships.where(friend_id: params[:id]).first
    @friendship2 = @friend.friendships.where(friend_id: current_user.id).first
    Friendship.destroy([@friendship1.id, @friendship2.id])
    flash[:notice] = "Friend was successfully removed"
    redirect_to my_friends_path
  end
  
end