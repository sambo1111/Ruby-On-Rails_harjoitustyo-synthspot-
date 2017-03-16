require 'test_helper'

class UserInstrumentsControllerTest < ActionController::TestCase
  setup do
    @user_instrument = user_instruments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_instruments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_instrument" do
    assert_difference('UserInstrument.count') do
      post :create, user_instrument: { instrument_id: @user_instrument.instrument_id, user_id: @user_instrument.user_id }
    end

    assert_redirected_to user_instrument_path(assigns(:user_instrument))
  end

  test "should show user_instrument" do
    get :show, id: @user_instrument
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_instrument
    assert_response :success
  end

  test "should update user_instrument" do
    patch :update, id: @user_instrument, user_instrument: { instrument_id: @user_instrument.instrument_id, user_id: @user_instrument.user_id }
    assert_redirected_to user_instrument_path(assigns(:user_instrument))
  end

  test "should destroy user_instrument" do
    assert_difference('UserInstrument.count', -1) do
      delete :destroy, id: @user_instrument
    end

    assert_redirected_to user_instruments_path
  end
end
