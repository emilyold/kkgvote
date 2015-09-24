require 'test_helper'

class PnmsControllerTest < ActionController::TestCase
  setup do
    @pnm = pnms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pnms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pnm" do
    assert_difference('Pnm.count') do
      post :create, pnm: { name: @pnm.name }
    end

    assert_redirected_to pnm_path(assigns(:pnm))
  end

  test "should show pnm" do
    get :show, id: @pnm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pnm
    assert_response :success
  end

  test "should update pnm" do
    patch :update, id: @pnm, pnm: { name: @pnm.name }
    assert_redirected_to pnm_path(assigns(:pnm))
  end

  test "should destroy pnm" do
    assert_difference('Pnm.count', -1) do
      delete :destroy, id: @pnm
    end

    assert_redirected_to pnms_path
  end
end
