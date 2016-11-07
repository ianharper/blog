module ArticlesHelper
	def article_params
  		params.require(:article).permit(:title, :body, :tag_list, :image, :category_name)
	end


end
