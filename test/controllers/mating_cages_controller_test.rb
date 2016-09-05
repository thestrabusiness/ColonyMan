require 'test_helper'

class MatingCagesControllerTest < ActionController::TestCase
  setup do
    @mating_cage = mating_cages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mating_cages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mating_cage" do
    assert_difference('MatingCage.count') do
      post :create, mating_cage: { cage_id: @mating_cage.cage_id, mated: @mating_cage.mated, strain1: @mating_cage.strain1, strain2: @mating_cage.strain2 }
    end

    assert_redirected_to mating_cage_path(assigns(:mating_cage))
  end

  test "should show mating_cage" do
    get :show, id: @mating_cage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mating_cage
    assert_response :success
  end

  test "should update mating_cage" do
    patch :update, id: @mating_cage, mating_cage: { cage_id: @mating_cage.cage_id, mated: @mating_cage.mated, strain1: @mating_cage.strain1, strain2: @mating_cage.strain2 }
    assert_redirected_to mating_cage_path(assigns(:mating_cage))
  end

  test "should destroy mating_cage" do
    assert_difference('MatingCage.count', -1) do
      delete :destroy, id: @mating_cage
    end

    assert_redirected_to mating_cages_path
  end
end
