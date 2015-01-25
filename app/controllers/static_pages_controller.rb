class StaticPagesController < ApplicationController
	def index
		if user_signed_in?
			if current_user.profile
				#redirected to another controller
				#render shows a view
				redirect_to tweets_path
			else
				#flash survives redirects, .now means do not survive a redirect but survives a render
				flash[:success] = "Create a profile below."
				redirect_to new_profile_path
			end
		end
	end
end
