class UserMailer < ApplicationMailer
  default from: 'khinezinthaw71@gmail.com'

  def welcome_email(user)
      @user = user
      @url = 'http://localhost:3000/login'
      mail(to: @user.email, subject: 'Welcome to My Website')
  end

  def forget_password_email(user)
    @user = user
    @url = 'http://localhost:3000/reset-password'
    mail(to: @user.email, subject: 'Forget Password Information')
  end
end
