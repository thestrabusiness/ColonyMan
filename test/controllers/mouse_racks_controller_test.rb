require 'test_helper'

class MouseRacksControllerTest < ActionController::TestCase
  setup do
    @mouse_rack = mouse_racks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mouse_racks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mouse_rack" do
    assert_difference('MouseRack.count') do
      post :create, mouse_rack: { number: @mouse_rack.number, side: @mouse_rack.side, type: @mouse_rack.type }
    end

    assert_redirected_to mouse_rack_path(assigns(:mouse_rack))
  end

  test "should show mouse_rack" do
    get :show, id: @mouse_rack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mouse_rack
    assert_response :success
  end

  test "should update mouse_rack" do
    patch :update, id: @mouse_rack, mouse_rack: { number: @mouse_rack.number, side: @mouse_rack.side, type: @mouse_rack.type }
    assert_redirected_to mouse_rack_path(assigns(:mouse_rack))
  end

  test "should destroy mouse_rack" do
    assert_difference('MouseRack.count', -1) do
      delete :destroy, id: @mouse_rack
    end

    assert_redirected_to mouse_racks_path
  end
end
