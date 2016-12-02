require 'test_helper'

class HelloControllerTest < ActionController::TestCase
	test 'list action' do
		get :list
		assert_equal 10,assigns(:books).length,'found rows is wrong.'
		assert_response :success,'list action failed.'
		assert_template 'hello/list'
	end
end
