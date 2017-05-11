class TopController < ApplicationController
	def index
		@recentPosts = Article.all.order("id desc").limit(10)
	end
end
