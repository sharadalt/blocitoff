class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  #before_create {generate_token(:auth_token) }
   
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 100 },
    format: { with: EMAIL_REGEX }
             
  has_secure_password
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    
    UserMailer.password_reset(self).deliver
    
  end
  
  def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
  end      
end
