class Article < ApplicationRecord
	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	has_many :comments, dependent: :delete_all
	has_many :taggings, dependent: :delete_all
	has_many :tags, through: :taggings
	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end
	def tag_list=(tags_list)
		tag_names = tags_list.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect{|name| Tag.find_or_create_by(name: name)}
		self.tags = new_or_found_tags
	end
end
