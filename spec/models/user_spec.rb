describe User do
  let!(:user) do
    User.create(email: 'joe.bloggs@email.com', password: 'strongpassword', password_confirmation: 'strongpassword')
  end

  describe '.authenticate' do
    it 'authenticates user when valid email and pw given' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticates when invalid password is given' do
      authenticated_user = User.authenticate(user.email, 'wrongpassword')
      expect(authenticated_user).not_to eq user
    end
  end
end
