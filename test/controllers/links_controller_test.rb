require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should make url into database" do
    post "http://localhost:3000/register.json?url=google.com"
    assert @response.body
    assert_response :success
  end
end
