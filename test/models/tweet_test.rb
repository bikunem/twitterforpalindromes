require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:hannah)
    @tweet = @user.tweet.build(content: "racecar")
  end

  test "should be vaild" do
    assert @tweet.vaild?
  end

  test "user id is present" do
    @tweet.user_id = nil
    assert_not @tweet.vaild?
  end

  test "most recent first" do
    assert_equal tweets(:most_recent), Tweet.first
  end
  
end
