class AuthorSessionsController < ApplicationController
	def new
	end
	def create
		# params[:remember_me] = false;
		if (@article = login(params[:email], params[:password]))
			redirect_back_or_to(articles_path, notice: "Logged in ok")
		else
			flash.now.alert = "Failed"
			render action: :new
		end
	end
	def destroy
		logout
		redirect_to(:authors, notice: "Logged out")
	end
end
