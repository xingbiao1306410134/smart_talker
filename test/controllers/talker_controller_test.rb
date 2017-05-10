require 'test_helper'

class TalkerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get talker_index_url
    assert_response :success
  end

  test "should get text" do
    get talker_text_url
    assert_response :success
  end

  test "should get t_a" do
    get talker_t_a_url
    assert_response :success
  end

  test "should get a_t" do
    get talker_a_t_url
    assert_response :success
  end

end
