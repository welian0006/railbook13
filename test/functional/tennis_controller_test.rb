require 'test_helper'

class TennisControllerTest < ActionController::TestCase
  setup do
    @tenni = tennis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tennis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenni" do
    assert_difference('Tenni.count') do
      post :create, tenni: { name: @tenni.name, published: @tenni.published }
    end

    assert_redirected_to tenni_path(assigns(:tenni))
  end

  test "should show tenni" do
    get :show, id: @tenni
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenni
    assert_response :success
  end

  test "should update tenni" do
    put :update, id: @tenni, tenni: { name: @tenni.name, published: @tenni.published }
    assert_redirected_to tenni_path(assigns(:tenni))
  end

  test "should destroy tenni" do
    assert_difference('Tenni.count', -1) do
      delete :destroy, id: @tenni
    end

    assert_redirected_to tennis_path
  end
end
