module Features
  def sign_up(name, email)
    visit 'users/sign_up'
    
    fill_in 'user_name', with: name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
  end
end