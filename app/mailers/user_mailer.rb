class UserMailer < ApplicationMailer

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'FnF Cabins Password Reset'
  end

  def pre_registration(user)
    @user = user
    mail to: user.email, subject: 'Welcome to FnF 2016 Cabins'
  end
end
