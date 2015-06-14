class ForgetMailer < ActionMailer::Base
  default from: "from@example.com"

  def forget(user)
    random = Random.new
    @user = user
    @key = random.rand(100..999).to_s
    @user.update_attribute(:pass_key,@key)
    mail(
      to:user.email,
      subject:"pass_key"
    )
  end
end
