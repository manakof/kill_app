class MyMailer < ActionMailer::Base
  default from: "from@example.com"

  def connection(user)
    @user = user
    mail(
    to:'manakof@hotmail.co.jp',
    subject:"now create new account!"
    )
  end
end
