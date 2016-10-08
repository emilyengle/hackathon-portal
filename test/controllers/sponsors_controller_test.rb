require 'test_helper'

class SponsorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sponsors_index_url
    assert_response :success
  end

  test "should get show" do
    get sponsors_show_url
    assert_response :success
  end

  test "should get new" do
    get sponsors_new_url
    assert_response :success
  end

  test "should get create" do
    get sponsors_create_url
    assert_response :success
  end

  test "should get edit" do
    get sponsors_edit_url
    assert_response :success
  end

  test "should get update" do
    get sponsors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sponsors_destroy_url
    assert_response :success
  end

end
