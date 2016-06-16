require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password, message: 'Your passwords do not match, please try again.'
  # validates_presence_of :emails
  # validates_format_of :email, as: :email_address
  # validates_uniqueness_of :email, message: 'This email has already been registered'

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email) # email: is the property :email defined above (header of table)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
