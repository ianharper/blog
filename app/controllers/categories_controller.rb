class CategoriesController < ApplicationController
	before_filter :require_login, only: [:destroy]
	def show
		@category = Category.find(params[:id])
	end

	def index
		@categories = Category.all
	end

	# def destroy
	# 	@tag = Tag.find(params[:id])
	# 	@tag.destroy

	# 	flash.notice = "Tag '#{@tag.name}' Deleted!"

	# 	redirect_to tags_path
	# end
end