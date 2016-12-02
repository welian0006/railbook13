require 'test_helper'

class ClonetsControllerTest < ActionController::TestCase
  setup do
    @clonet = clonets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clonets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clonet" do
    assert_difference('Clonet.count') do
      post :create, clonet: { name: @clonet.name }
    end

    assert_redirected_to clonet_path(assigns(:clonet))
  end

  test "should show clonet" do
    get :show, id: @clonet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clonet
    assert_response :success
  end

  test "should update clonet" do
    put :update, id: @clonet, clonet: { name: @clonet.name }
    assert_redirected_to clonet_path(assigns(:clonet))
  end

  test "should destroy clonet" do
    assert_difference('Clonet.count', -1) do
      delete :destroy, id: @clonet
    end

    assert_redirected_to clonets_path
  end
end
