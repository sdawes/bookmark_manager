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

  scenario 'doesnt create user if email is blank' do
    expect{ sign_in(email: '') }.not_to change(User, :count)
  end

  scenario 'has a valid email address' do
    expect{ sign_in(email: 'freddy.gmail.com') }.not_to change(User, :count)
  end

  scenario 'cannot sign up with an already registered user' do
    sign_in
    expect{ sign_in(email: 'joe.bloggs@email.com') }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
