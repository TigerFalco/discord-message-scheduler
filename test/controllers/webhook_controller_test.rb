require 'test_helper'

class WebhookControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get webhook_new_url
    assert_response :success
  end

  test "should get create" do
    get webhook_create_url
    assert_response :success
  end

  test "should get edit" do
    get webhook_edit_url
    assert_response :success
  end

  test "should get update" do
    get webhook_update_url
    assert_response :success
  end

  test "should get delete" do
    get webhook_delete_url
    assert_response :success
  end

  test "should get list" do
    get webhook_list_url
    assert_response :success
  end

end
