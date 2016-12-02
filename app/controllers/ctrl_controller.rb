class CtrlController < ApplicationController
	respond_to :html,:xml,:json
	before_filter :auth2,:only=>'index'
	before_filter :auth,:only=> 'show_me'
	before_filter :start_logger
	after_filter :end_logger
	skip_before_filter :start_app_log
	skip_before_filter :end_app_log
	
	#around_filter :around_logger
	
	def get_xml
		@books = Book.all
		render :xml=> @books
	end
	
	def get_xml2
		#render :xml=>'<error>123 Failed</error>'
		render :xml=>'123'
	end
	
	def get_json
		@books = Book.all
		render :json=>@books
	end
	
	def hash_to_xml
		#hash = {"a"=>"apple","b"=>"banana","c"=>"cat"}
		hash = ["aa","bb","cc","dd"]
		render :xml=>hash.to_xml(:root=>"fruit")
	end
	
	def any_format
	end
	
	def xml_erb
		@book = Book.find(params[:id])
		respond_to do |format|
			format.xml
		end
	end
	
	def test_format
		@books = Book.all
		respond_to do  |format|
			format.html { render :html=>@books}
		end
	end
	
	def respond_to_all
		@books = Book.all
		respond_with @books
	end
	
	def test_atom_feed
		@books = Book.all
		
		respond_to do |format|
			format.html
			format.xml { render :xml=> @books}
			format.atom
		end
	end
	
	def cookie
		@email = cookies.signed[:email]
	end
	
	def cookie_rec
		cookies.signed[:email] = {:value=> params[:email],:expires=>3.months.from_now,:http_only=>true}
		render :text=>'クッキーを保存しました'
	end
	
	def delete_cookie
		cookies.delete(:email)
		#cookies[:email].delete
		render :text=>'クッキーは削除しました'
	end
	
	def session_show
		@email = session[:email] 
	end
	
	def session_rec
		session[:email] = params[:email]
		render :text=>'セッションを保存しました'
	end
	
	def delete_session
		session.delete(:email)
		render :text=>'セッションを削除しました'
	end
	
	def delete_session_test
		session[:a]="apple"
		session[:b]="banana"
		session.delete(:a)
		render :text=>"Now session a is "+session[:a].to_s+" session b is "+session[:b].to_s
	end
	
	def delete_all_sessions
		reset_session
		render :text=>'全てのセッションは削除しました'
	end
	
	def simple_redirect
		#redirect_to '/ctrl/after_redirect',:alert=>'Truely after the redirect'
		flash.keep[:msg] = "Book was successfully created"
		#flash.discard(:msg)
		#render :text=>"var is"+flash.now[:msg]
		redirect_to '/ctrl/after_redirect'
	end
	
	def after_redirect
		#render :text=>"after redirect is notice variable is"+alert
		flash.discard(:msg)
		render :text=>"after redirect is notice variable is"+flash[:msg]
	end
	
	def index
		sleep 3
		render :text=>'indexアクションを実行されました'
	end
	
	def index2
		sleep 3
		render :text=>'indexアクションを実行されました'
	end
	
	def test_fullpath
		render :text => 'full path is------>'+request.fullpath
	end
		
	def from_flash
		flash[:msg] = "This is from flash message"
		redirect_to '/ctrl/final_flash'
	end
	
	def final_flash
		flash[:msg] = 'This is now final flash message'
	end
	
	def has_many_test
		@book = Book.find(1)
		#render :text=>@book.inspect
		@reviews = @book.reviews
	end
	
	def test_date
		render :text => "Date is "+Date.new(2016,11,12).to_s + "date class is "+Date.new(2016,11,12).class.to_s
	end
	
	def test_js_key
		@books = Book.all
		#render :text => 'first book isbn is '+@books[0](:js).isbn
		#render :text => 'fixture key isbn value is '+books(:js).isbn
	end
	
	def show_me
		render :text=> 'This is show me page'
	end
	
	private
	
	def start_logger
		logger.debug('[Starts_9]'+Time.now.to_s)
	end
	
	def end_logger
		logger.debug('[Finishs_9]'+Time.now.to_s)
	end
	
	def around_logger
		logger.debug('[Start1]'+Time.now.to_s)
		yield
		logger.debug('[Finish1]'+Time.now.to_s)
	end
	
	def auth
		name = 'weiliang'
		pass_before_hashed = '12345'
		authenticate_or_request_with_http_basic('Railbook') do |n,p|
			n == name && Digest::SHA1.hexdigest(p)==Digest::SHA1.hexdigest(pass_before_hashed)
		end
		
	end
	
	def auth2
		members = {'weiliang'=>'12345'}
		authenticate_or_request_with_http_digest('Railsbook') do |name|
			members[name]
		end
		#logger.debug('important resultzzz is'+result.to_s)
	end
	
	
end
