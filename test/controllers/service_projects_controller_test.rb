require 'test_helper'

class ServiceProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_project = service_projects(:one)
  end

  test "should get index" do
    get service_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_service_project_url
    assert_response :success
  end

  test "should create service_project" do
    assert_difference('ServiceProject.count') do
      post service_projects_url, params: { service_project: { end_time: @service_project.end_time, host_id: @service_project.host_id, location: @service_project.location, max_volunteers: @service_project.max_volunteers, name: @service_project.name, start_time: @service_project.start_time, type: @service_project.type } }
    end

    assert_redirected_to service_project_url(ServiceProject.last)
  end

  test "should show service_project" do
    get service_project_url(@service_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_project_url(@service_project)
    assert_response :success
  end

  test "should update service_project" do
    patch service_project_url(@service_project), params: { service_project: { end_time: @service_project.end_time, host_id: @service_project.host_id, location: @service_project.location, max_volunteers: @service_project.max_volunteers, name: @service_project.name, start_time: @service_project.start_time, type: @service_project.type } }
    assert_redirected_to service_project_url(@service_project)
  end

  test "should destroy service_project" do
    assert_difference('ServiceProject.count', -1) do
      delete service_project_url(@service_project)
    end

    assert_redirected_to service_projects_url
  end
end
