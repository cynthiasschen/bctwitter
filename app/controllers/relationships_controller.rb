class RelationshipsController < ApplicationController

	def create

		@user = User.find(relationship_params[:followed_id])
		if current_user.following?(@user)
			if(current_user.unfollow(@user))
				flash[:success] = "You have stopped following #{@user.profile.profile_name}"
			else 
				flash[:warning] = "The user cannot be unfollowed at this time."
			end
	    else
	     	if current_user.follow(@user)
				flash[:success] = "You are now following #{@user.profile.profile_name}"
			else
				flash[:danger] = "The user cannot be followed at this time."
			end
		end
		redirect_to tweets_path
	end

	private 

	def relationship_params
		params.require(:relationship).permit(:followed_id)
	end

end
