#coding:utf-8
class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user 

			#make user sign in ,and connect user page
		else
			#show error message,and redirect itself
			flash.now[:error] = 'メールアドレスかパスワードに誤りがあります'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
