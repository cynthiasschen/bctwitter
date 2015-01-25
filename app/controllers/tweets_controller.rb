class TweetsController < ApplicationController
#convention to use the same instance variable name

#do not let a not signed in user access the page, ! means throw an error if it fails
	before_action :authenticate_user!

	def new
		@tweet = Tweet.new
		@tweets = current_user.tweets
	end

	def create

		#tweet.create is short for tweet.new and tweet.save
		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		@tweets = current_user.tweets

		if @tweet.save
			#flash is a built in hash
			flash.now[:success] = "Tweet Created"
		end
		#render new.html.erb page
		render 'new'
	end

	def index
		#get array of all tweets, discard all tweets if the tweet's user is the current user
		@tweets = Tweet.all.reject{ |tweet| tweet.user == current_user}
		@relationship = Relationship.new
	end

	private 

	def tweet_params
		#if the tweet is not part of the params hash, don't accept it. Only permit content.
		params.require(:tweet).permit(:content)
	end
end
