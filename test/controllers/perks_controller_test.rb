require 'test_helper'

class PerksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get perks_index_url
    assert_response :success
  end

  test "should get new" do
    get perks_new_url
    assert_response :success
  end

  test "should get create" do
    get perks_create_url
    assert_response :success
  end

  test "should get edit" do
    get perks_edit_url
    assert_response :success
  end

  test "should get update" do
    get perks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get perks_destroy_url
    assert_response :success
  end

end
