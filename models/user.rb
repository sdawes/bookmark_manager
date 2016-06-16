require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  # validates_presence_of :emails
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :password_digest, Text, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end



end
