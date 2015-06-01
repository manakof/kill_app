class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation(user)
    @user = user
    @key = rand(8).to_s
    @user.update_attribute(:pass_key,@key)
    mail(
      to: user.email,
      subject:"hello"
    )
  end
end
