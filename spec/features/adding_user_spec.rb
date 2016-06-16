feature 'Singing in a user' do
  scenario 'Singin in as a new user' do
    expect{ sign_in }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, joe.bloggs@email.com'
    expect(User.first.email).to eq 'joe.bloggs@email.com'
  end

  scenario 'requires a confirmation password' do
    expect{ sign_in(password_confirmation: 'incorrect') }.not_to change(User, :count)
  end

  scenario 'shows error message if passwords don\'t match' do
    sign_in(password_confirmation: 'incorrect')
    expect(page.current_path).to eq '/users'
    expect(page).to have_content 'Your passwords do not match, please try again.' 

  end
end
