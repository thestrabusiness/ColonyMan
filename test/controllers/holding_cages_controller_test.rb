require 'test_helper'

class HoldingCagesControllerTest < ActionController::TestCase
  setup do
    @holding_cage = holding_cages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:holding_cages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create holding_cage" do
    assert_difference('HoldingCage.count') do
      post :create, holding_cage: { cage_id: @holding_cage.cage_id, dob: @holding_cage.dob, occupancy: @holding_cage.occupancy, sex: @holding_cage.sex }
    end

    assert_redirected_to holding_cage_path(assigns(:holding_cage))
  end

  test "should show holding_cage" do
    get :show, id: @holding_cage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @holding_cage
    assert_response :success
  end

  test "should update holding_cage" do
    patch :update, id: @holding_cage, holding_cage: { cage_id: @holding_cage.cage_id, dob: @holding_cage.dob, occupancy: @holding_cage.occupancy, sex: @holding_cage.sex }
    assert_redirected_to holding_cage_path(assigns(:holding_cage))
  end

  test "should destroy holding_cage" do
    assert_difference('HoldingCage.count', -1) do
      delete :destroy, id: @holding_cage
    end

    assert_redirected_to holding_cages_path
  end
end
