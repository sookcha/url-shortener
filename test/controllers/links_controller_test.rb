require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/1"
    assert_response :success
  end

  test "should show stats" do
    get "/1/stats"
    assert_response :success
  end

  test "should make url into database" do
    post "register.json?link=http://www.vingle.net"
    assert_response :success
  end

  test "should get a generated url" do
    post "register.json?link=http://www.vingle.net"
    post "register.json?link=http://www.vingle.net"

    assert_response :success
  end

end
