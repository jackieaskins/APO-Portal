require 'test_helper'

class FellowshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fellowship = fellowships(:one)
  end

  test "should get index" do
    get fellowships_url
    assert_response :success
  end

  test "should get new" do
    get new_fellowship_url
    assert_response :success
  end

  test "should create fellowship" do
    assert_difference('Fellowship.count') do
      post fellowships_url, params: { fellowship: { description: @fellowship.description, end_time: @fellowship.end_time, location: @fellowship.location, start_time: @fellowship.start_time, title: @fellowship.title, type: @fellowship.type } }
    end

    assert_redirected_to fellowship_url(Fellowship.last)
  end

  test "should show fellowship" do
    get fellowship_url(@fellowship)
    assert_response :success
  end

  test "should get edit" do
    get edit_fellowship_url(@fellowship)
    assert_response :success
  end

  test "should update fellowship" do
    patch fellowship_url(@fellowship), params: { fellowship: { description: @fellowship.description, end_time: @fellowship.end_time, location: @fellowship.location, start_time: @fellowship.start_time, title: @fellowship.title, type: @fellowship.type } }
    assert_redirected_to fellowship_url(@fellowship)
  end

  test "should destroy fellowship" do
    assert_difference('Fellowship.count', -1) do
      delete fellowship_url(@fellowship)
    end

    assert_redirected_to fellowships_url
  end
end
