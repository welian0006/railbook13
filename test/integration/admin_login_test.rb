require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
	test 'login test' do
		get '/hello/view'
		assert_response :redirect
		assert_redirected_to :controller => 'login', :action => 'index'
		assert_equal '/hello/view',flash[:referer]
		#assert false,"redirect?----------------->"+redirect?.to_s
		
		follow_redirect!
		
		#assert false,"redirect?----------------->"+redirect?.to_s
		
		assert_response :success
		assert_equal '/hello/view',flash[:referer]
		
		post '/login/auth', {:username =>'yyamada',:password => '12345', :referer => '/hello/view'}
		
		assert_response :redirect
		#assert_redirected_to :controller=> 'hello',:action => 'view'
		assert_equal users(:yyamada).id,session[:usr]
		
		follow_redirect!
		
		#post_via_redirect '/login/auth',{:username => 'yyamad', :password => '1235',:referer => '/hello/view'}
		assert_response :success
		
		assert_equal true,false
		
		
		
	end
	
	test 'hello list' do
		get '/hello/list'
		assert_response :success
	end
end
