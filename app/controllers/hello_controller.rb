class HelloController < ApplicationController
	before_filter :check_logined, :only => ['view','view2']
	def view
		render :text => "This is the view text"
	end
	
	def view2
	end
	
	def print_me
		render :text=> 'This is print me'
	end
	
	def category
		render :text => 'category param is---'+params[:category]
	end
	
	def list
		@title = "This is Rails 3 title"
		@books = Book.all
	end
	
	def inline_test
		render :text => '<b>This is inline</b><%= request.headers %>'
	end
	private
	def check_logined
		if session[:usr] then
			begin
				@usr = User.find(session[:usr])
			rescue ActiveRecord::RecordNotFound
				reset_session
			end
		end
		
		unless @usr
			flash[:referer] = request.fullpath
			redirect_to :controller => 'login', :action => 'index'
		end
	end
end
