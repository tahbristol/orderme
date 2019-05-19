module Features
  def sign_up_as_purchaser(name, email)
    visit 'users/sign_up'
    
    fill_in 'user_name', with: name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    check 'user[role]'
    
    click_on 'Sign up'
    
    User.first  
  end
end