describe 'User signs out' do

  before(:each) do
    User.create(email: 'cranby@email.com', password: 'password', password_confirmation: 'password')
  end

  scenario 'while being signed in' do
    sign_in(email: 'cranby@email.com', password: 'password')
    click_button 'Sign Out'
    expect(page).to have_content('Sorry to see you go, Goodbye')
    expect(page).not_to have_content('Welcome, cranby@email.com')
  end

end
