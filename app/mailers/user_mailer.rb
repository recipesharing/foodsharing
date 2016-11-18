class UserMailer < ApplicationMailer
  default from: 'admin@example.com'

  def signup_thank(user)
    @user = user
    @url = Faker::Internet.url
    mail(to: @user.email, subject: 'thank you for signup!')
  end
end
