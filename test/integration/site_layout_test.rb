require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)    
  end

  def root_href_test(login: 1)
    login == 1 ? account_count = 1 : account_count = 0
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path, count: account_count
    assert_select "a[href=?]", user_path(@user), count: account_count
    assert_select "a[href=?]", edit_user_path(@user), count: account_count
    assert_select "a[href=?]", logout_path, count: account_count
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
  end

  test "layout links" do
    root_href_test(login: 0)
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
    log_in_as(@user)
    root_href_test(login: 1)
  end
end
