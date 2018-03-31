require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "http://localhost:3000/1"
    assert_response :success
  end

  test "should show stats" do
    get "http://localhost:3000/1/stats"
    assert_response :success
  end

  test "should make url into database" do
    post "http://localhost:3000/register.json?link=http://www.vingle.net"
    assert_response :success
  end

  test "should get a generated url" do
    post "http://localhost:3000/register.json?link=http://www.vingle.net"
    post "http://localhost:3000/register.json?link=http://www.vingle.net"

    assert_response :success
  end

end
