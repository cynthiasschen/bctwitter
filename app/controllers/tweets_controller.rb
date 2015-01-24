class TweetsController < ApplicationController
#convention to use the same instance variable name

#do not let a not signed in user access the page, ! means throw an error if it fails
	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
	end

	def create

		#tweet.create is short for tweet.new and tweet.save
		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		@tweet.save
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
