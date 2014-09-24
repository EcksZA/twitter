class User < ActiveRecord::Base
  after_create :send_welcome_message
  before_create :add_handle

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :handle, presence:true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :posts

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end

  def add_handle
    self.handle = '@' + self.handle
  end
end
