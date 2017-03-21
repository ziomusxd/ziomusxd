require 'test_helper'

class TobuysControllerTest < ActionController::TestCase
  setup do
    @tobuy = tobuys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tobuys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tobuy" do
    assert_difference('Tobuy.count') do
      post :create, tobuy: { desctiption: @tobuy.desctiption, name: @tobuy.name, quantity: @tobuy.quantity }
    end

    assert_redirected_to tobuy_path(assigns(:tobuy))
  end

  test "should show tobuy" do
    get :show, id: @tobuy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tobuy
    assert_response :success
  end

  test "should update tobuy" do
    patch :update, id: @tobuy, tobuy: { desctiption: @tobuy.desctiption, name: @tobuy.name, quantity: @tobuy.quantity }
    assert_redirected_to tobuy_path(assigns(:tobuy))
  end

  test "should destroy tobuy" do
    assert_difference('Tobuy.count', -1) do
      delete :destroy, id: @tobuy
    end

    assert_redirected_to tobuys_path
  end
end
