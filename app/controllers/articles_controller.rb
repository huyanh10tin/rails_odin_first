class ArticlesController < ApplicationController
	before_action :require_login, except: [:index, :show]
	include ArticlesHelper
	def index
		@articles = Article.all
	end
	def feed
		@articles = Article.all
		respond_to do |format|
			format.rss {render :layout => false}
		end
	end
	def show
		@article = Article.find(params[:id])
		@article.view_count = @article.view_count + 1
		@article.save
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
		@article.destroy
		flash[:success] = "Article deleted"
		redirect_to articles_path
		
	end
end
