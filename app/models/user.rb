class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    trimmed_email = email.strip
    no_case_email = trimmed_email.downcase
    user = User.find_by(email: no_case_email)
    if user.authenticate(password)
      return user
    else
      return nil
    end
  end

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: {minimum: 6}
  validates :password_confirmation, :presence => true
end
