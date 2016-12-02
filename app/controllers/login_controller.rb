class LoginController < ApplicationController
	def auth
		usr = User.authenticate(params[:username],params[:password])
		if usr 
			session[:usr] = usr.id
			redirect_to params[:referer]
		else
			flash.now[:referer] = params[:referer]
			@error = 'ユーザ名・パスワードが間違っていた'
			render 'index'
		end
	end
	
	def logout
		reset_session
		redirect_to '/'
	end
end
