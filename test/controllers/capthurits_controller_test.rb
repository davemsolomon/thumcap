require 'test_helper'

class CapthuritsControllerTest < ActionController::TestCase
  setup do
    @capthurit = capthurits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capthurits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capthurit" do
    assert_difference('Capthurit.count') do
      post :create, capthurit: { capthurstart: @capthurit.capthurstart, filename: @capthurit.filename, stationname: @capthurit.stationname }
    end

    assert_redirected_to capthurit_path(assigns(:capthurit))
  end

  test "should show capthurit" do
    get :show, id: @capthurit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @capthurit
    assert_response :success
  end

  test "should update capthurit" do
    patch :update, id: @capthurit, capthurit: { capthurstart: @capthurit.capthurstart, filename: @capthurit.filename, stationname: @capthurit.stationname }
    assert_redirected_to capthurit_path(assigns(:capthurit))
  end

  test "should destroy capthurit" do
    assert_difference('Capthurit.count', -1) do
      delete :destroy, id: @capthurit
    end

    assert_redirected_to capthurits_path
  end
end
