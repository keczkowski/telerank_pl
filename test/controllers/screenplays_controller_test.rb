require 'test_helper'

class ScreenplaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @screenplay = screenplays(:one)
  end

  test "should get index" do
    get screenplays_url
    assert_response :success
  end

  test "should get new" do
    get new_screenplay_url
    assert_response :success
  end

  test "should create screenplay" do
    assert_difference('Screenplay.count') do
      post screenplays_url, params: { screenplay: { body: @screenplay.body, name: @screenplay.name } }
    end

    assert_redirected_to screenplay_url(Screenplay.last)
  end

  test "should show screenplay" do
    get screenplay_url(@screenplay)
    assert_response :success
  end

  test "should get edit" do
    get edit_screenplay_url(@screenplay)
    assert_response :success
  end

  test "should update screenplay" do
    patch screenplay_url(@screenplay), params: { screenplay: { body: @screenplay.body, name: @screenplay.name } }
    assert_redirected_to screenplay_url(@screenplay)
  end

  test "should destroy screenplay" do
    assert_difference('Screenplay.count', -1) do
      delete screenplay_url(@screenplay)
    end

    assert_redirected_to screenplays_url
  end
end
