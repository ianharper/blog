class Article < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings
	has_one :categorization
	has_one :category, through: :categorization
	has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	def tag_list
		tags.join(",")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  		self.tags = new_or_found_tags
	end

	def category_name
		Category.all.pluck(:name)
	end	

	def category_name=(category_string)
		p category_string
		self.category = Category.find_by(name: category_string)
	end
end
