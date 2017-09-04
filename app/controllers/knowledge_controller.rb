class KnowledgeController < ApplicationController
	TEXT = '1'
	CODE = '2'
	JAVA = '3'
	PHP = '4'
	PYTHON = '5'
	RUBY = '6'
	HTML = '7'
	CSS = '8'
	JAVASCRIPT = '9'
	LINUX = '10'
	SQL = '11'

	DRAFT = '0'
	PUBLIC = '1'

	def index
		if params[:category]
			@paramCategory = Category.find_by(name: params[:category])
			@middleCategoriesByParam = MiddleCategory.where(:category => @paramCategory)
			@smallCategoriesByParam = SmallCategory.where(:middle_category => @middleCategoriesByParam)
			@articlesByParam = Article.where(:small_category => @smallCategoriesByParam)

			@category = @paramCategory
		end

		if params[:middle_category]
			@paramMiddleCategory = MiddleCategory.find_by(name: params[:middle_category])
			@smallCategoriesByParam = SmallCategory.where(:middle_category => @paramMiddleCategory)
			@articlesByParam = Article.where(:small_category => @smallCategoriesByParam)

			@category = @paramMiddleCategory.category
		end

		if params[:small_category]
			@paramSmallCategory = SmallCategory.find_by(name: params[:small_category])
			@articlesByParam = Article.where(:small_category => @paramSmallCategory)

			@category = @paramSmallCategory.middle_category.category
		end
		@articleCount = @articlesByParam.count
	end

	def show
		@article = Article.find(params[:id])
		@small_category = @article.small_category
		@middle_category = @small_category.middle_category
		@category = @middle_category.category
		@sentence = @article.sentence

		@parse = JSON.parse(@sentence)

		@metaTitle = @article.title

		@relatedArticles = Article.where(:small_category => @small_category).order("created_at DESC").limit(10)
	end
end
