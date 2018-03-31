require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should make url into database" do
    post "http://localhost:3000/register.json?url=google.com"
    assert @response.body
    assert @response.status, "201"
    assert_response :success
  end

  test "should redirect to original url" do
    post "http://localhost:3000/register.json?url=google.com"
    post "http://localhost:3000/register.json?url=google.com"
    assert @response.status, "200"
    assert @response.body
    assert_response :success
  end
end
