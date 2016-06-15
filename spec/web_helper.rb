def sign_up(email: 'alice@example.com',
            password: 'password',
            password_confirmation: 'password')
  visit '/users/new'
  fill_in :email,     with: email
  fill_in :password,  with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

# def sign_up
#   visit '/users/new'
#   expect(page.status_code).to eq(200)
#   fill_in :email,     with: 'alice@example.com'
#   fill_in :password,  with: 'oranges!'
#   click_button 'Sign up'
# end
