class TagsController < ApplicationController
	before_action :require_login, only: [:destroy]
	def show
		@tag = Tag.find_by(id: params[:id])
		# @articles = Tag.find_by(name: params[:tag][:name]).articles
	end
	def index
		@tags = Tag.all
	end
	private
	def tag_params
		params.require(:tag).permit(:name)
	end
end	