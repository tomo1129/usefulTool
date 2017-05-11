class AdminController < ApplicationController
	before_filter :basic_auth, only: [:index, :show]
	def basic_auth
		authenticate_or_request_with_http_basic do |user,pass|
			user == Rails.application.secrets.auth_user && Rails.application.secrets.auth_password
		end
	end
	def index
		@articles = Article.all
	end
	def new
		@categorySelect = getCategorySelect()
	end
	def edit
		@categorySelect = getCategorySelect()
		@article = Article.find(params[:id])
		@parse = JSON.parse(@article.sentence)
	end
	def create
		@articleParam = params[:article]
		json = Array.new
		for key, value in @articleParam[:type]
			@sentence = {}
			@sentence['type'] = value
			@sentence['sentence'] = @articleParam[:sentence][key]
			json.push(@sentence)
		end

		@smallCategory = SmallCategory.find(@articleParam[:small_category])
		article = Article.new
		article.small_category = @smallCategory
		article.title = @articleParam[:title]
		article.sentence = JSON.generate(json)
		article.created_at = Time.now
		article.updated_at = Time.now
		article.description = @articleParam[:description]
		article.keywords = @articleParam[:keywords]
		article.public = @articleParam[:public]
		article.save

		redirect_to controller: 'admin', action: 'edit', id: article.id
	end
	def update
		@articleParam = params[:article]
		json = Array.new
		for key, value in @articleParam[:type]
			@sentence = {}
			@sentence['type'] = value
			@sentence['sentence'] = @articleParam[:sentence][key]
			json.push(@sentence)
		end

		@smallCategory = SmallCategory.find(@articleParam[:small_category])
		article = Article.find(params[:id])
		article.small_category = @smallCategory
		article.title = @articleParam[:title]
		article.sentence = JSON.generate(json)
		article.updated_at = Time.now
		article.description = @articleParam[:description]
		article.keywords = @articleParam[:keywords]
		article.public = @articleParam[:public]
		article.save

		redirect_to controller: 'admin', action: 'edit', id: article.id
	end

	def getCategorySelect
		@smallCategories = SmallCategory.all
		@categorySelect = {}
		for category in @smallCategories
			@categorySelect[category.name] = category.id
		end

		return @categorySelect
	end
end
