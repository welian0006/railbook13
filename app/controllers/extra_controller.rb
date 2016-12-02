class ExtraController < ApplicationController
	before_filter :auth, :only => ['p_cache','a_cache','f_cache']
	caches_page :p_cache
	caches_action :a_cache
	caches_page :p_cache2, :if=> Proc.new {|c| c.request.format.xml?}
	
	def p_cache
		render :text => Time.now
	end
	
	def a_cache
		render :text => Time.now
	end
	
	def p_cache2
		respond_to do |format|
			format.html {render :text => Time.now}
			format.xml {render :text => '<data>'+Time.now.to_s+'</data>'}
		end
	end
	
	def f_cache
	
	end
	
	def f_logic1
		unless fragment_exist?(:controller=>'extra',:action=>'f_logic1')
			@books = Book.all
		end
	end
	
	def get_locale_param
  	 render :text => "The locale param is--->"+params[:locale].to_s
  	end
	
	def paging
		@books = Book.order('published desc')
		.paginate(:page=>params[:page],:per_page=>5)
		#render :text => 'finished'
	end
	
	private
	def auth
		name = 'weiliang'
		pass_before_hashed = '12345'
		authenticate_or_request_with_http_basic('Railbook') do |n,p|
			n == name && Digest::SHA1.hexdigest(p)==Digest::SHA1.hexdigest(pass_before_hashed)
		end
		
	end
end
