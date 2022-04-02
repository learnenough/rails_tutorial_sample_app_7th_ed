require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end
end

class UserFollowingTest < ActiveSupport::TestCase

  def setup
    @michael = users(:michael)
    @archer  = users(:archer)
  end

  test "should be able to follow a user" do
    assert_not @michael.following?(@archer)
    @michael.follow(@archer)
    assert @michael.following?(@archer)
    assert @archer.followers.include?(@michael)
  end

  test "should be able to unfollow a user" do
    @michael.follow(@archer)
    @michael.unfollow(@archer)
    assert_not @michael.following?(@archer)
  end

  test "users shoudn't be able to follow themselves" do
    @michael.follow(@michael)
    assert_not @michael.following?(@michael)
  end
end

class UserFeed < UserFollowingTest

  def setup
    super
    @lana = users(:lana)
  end
end

class UserFeedTest < UserFeed

  test "should have posts from followed user" do
    @lana.microposts.each do |post_following|
      assert @michael.feed.include?(post_following)
    end
  end

  test "should have user's own posts" do
    @michael.microposts.each do |post_self|
      assert @michael.feed.include?(post_self)
    end
  end

  test "should not have posts from non-followed user" do
    @archer.microposts.each do |post_unfollowed|
      assert_not @michael.feed.include?(post_unfollowed)
    end
  end
end


