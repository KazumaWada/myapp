module LoginSupport

    def valid_login(user)
      visit root_path
      click_link "ログイン"
      visit login_path
      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button "Login"
    end
  end
  
  # LoginSupportモジュールをincludeする
  RSpec.configure do |config|
    config.include LoginSupport
  end

