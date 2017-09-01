class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		@article.save
		# cow = [1,2,3]
		redirect_to article_path(@article)
	end
	def edit
		@article = Article.find params[:id]
	end
	def update
		@article = Article.find params[:id]
		@article.update(article_params)
		redirect_to article_path(@article)
	end
	def destroy
		@article = Article.find params[:id]
		if @article.destroy
			redirect_to articles_path
		end
	end
end
