class MyCompUser < ActionMailer::Base
  default from: "from@example.com"

  def complete(user)
    @user = user
    mail(
      to: "manakof@hotmail.co.jp",
      subject:"登録情報"
    )
  end
end
