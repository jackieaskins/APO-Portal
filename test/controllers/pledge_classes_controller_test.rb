require 'test_helper'

class PledgeClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pledge_class = pledge_classes(:one)
  end

  test "should get index" do
    get pledge_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_pledge_class_url
    assert_response :success
  end

  test "should create pledge_class" do
    assert_difference('PledgeClass.count') do
      post pledge_classes_url, params: { pledge_class: { name: @pledge_class.name, semester: @pledge_class.semester } }
    end

    assert_redirected_to pledge_class_url(PledgeClass.last)
  end

  test "should show pledge_class" do
    get pledge_class_url(@pledge_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_pledge_class_url(@pledge_class)
    assert_response :success
  end

  test "should update pledge_class" do
    patch pledge_class_url(@pledge_class), params: { pledge_class: { name: @pledge_class.name, semester: @pledge_class.semester } }
    assert_redirected_to pledge_class_url(@pledge_class)
  end

  test "should destroy pledge_class" do
    assert_difference('PledgeClass.count', -1) do
      delete pledge_class_url(@pledge_class)
    end

    assert_redirected_to pledge_classes_url
  end
end
