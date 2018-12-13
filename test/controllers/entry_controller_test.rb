require 'test_helper'

class EntryControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get entry_form_url
    assert_response :success
  end

  test "should get show" do
    get entry_show_url
    assert_response :success
  end

end
