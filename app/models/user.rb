class User < ActiveRecord::Base
  attr_reader :password
  after_initialize :set_session_token
  validates :session_token, presence: true, uniqueness: true

  def set_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
    self.save!
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.session_token
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  # def self.find_by_credentials(user_name, password)
  #   user = User.find_by(user_name: user_name)
  #   if user
  #     if user.is_password?(password)
  #       user
  #     else
  #       raise "Password is invalid"
  #     end
  #   else
  #     raise "No user with credentials"
  #   end
  # end
  def self.find_by_credentials(username, password)
    p username
   user = User.find_by(user_name: username)
   p "LOOKING FOR USER"
   return nil if user.nil?
   p "found user"
   user.is_password?(password) ? user : nil
 end

end
