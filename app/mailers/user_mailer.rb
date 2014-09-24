class UserMailer < ActionMailer::Base
  default from: "xmfuko@gmail.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: 'Is this working?'
  end
end
