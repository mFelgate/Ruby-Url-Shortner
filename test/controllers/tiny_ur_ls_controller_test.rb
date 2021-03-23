require 'test_helper'

class TinyUrLsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tiny_url = tiny_urls(:one)
  end

  test "should get index" do
    get tiny_urls_url, as: :json
    assert_response :success
  end

  test "should create tiny_url" do
    assert_difference('TinyUrl.count') do
      post tiny_urls_url, params: { tiny_url: { long: @tiny_url.long, short: @tiny_url.short } }, as: :json
    end

    assert_response 201
  end

  test "should show tiny_url" do
    get tiny_url_url(@tiny_url), as: :json
    assert_response :success
  end

  test "should update tiny_url" do
    patch tiny_url_url(@tiny_url), params: { tiny_url: { long: @tiny_url.long, short: @tiny_url.short } }, as: :json
    assert_response 200
  end

  test "should destroy tiny_url" do
    assert_difference('TinyUrl.count', -1) do
      delete tiny_url_url(@tiny_url), as: :json
    end

    assert_response 204
  end
end
