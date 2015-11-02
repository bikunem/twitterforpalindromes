require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example", password: "password", password_confirmation: "password")
  end

  test "valid user" do
    assert @user.valid?
  end

  test "password is not blank" do
    @user.password = @user.password_confirmation = " " * 7
    assert_not @user.vali
  end

  test "password is 7 characters" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end


end
