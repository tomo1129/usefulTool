class ApplicationController < ActionController::Base
	# ここである必要はないけど。。。
	NUMERIC = '1'
	LOWER_ALPHABET = '2'
	UPPER_ALPHABET = '3'
	SYMBOL = '4'
	protect_from_forgery with: :exception
	@middleCategories = MiddleCategory.all.order("category_id asc, id asc")

end
