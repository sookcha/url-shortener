require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    post "http://localhost:3000/register.json?url=google.com"
    get "http://localhost:3000/1/stats"
    assert_response :success
  end

end
