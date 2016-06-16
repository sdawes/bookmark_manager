def sign_in
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'joe.bloggs@email.com'
  fill_in :password, with: 'strongpassowrd'
  click_button 'Sign in'
end
