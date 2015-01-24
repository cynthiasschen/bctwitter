class TweetsController < ApplicationController
#convention to use the same instance variable name
	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.create(tweet_params)
		#flash is a built in hash
		flash.now[:success] = "Tweet Created"
		#render new.html.erb page
		render 'new'
	end

	private 

	def tweet_params
		#if the tweet is not part of the params hash, don't accept it. Only permit content.
		params.require(:tweet).permit(:content)
	end
end
