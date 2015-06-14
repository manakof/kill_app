class CompUser < ActionMailer::Base
  default from: "from@example.com"

  def complete(user)
    attachments.inline['image.png'] = File.read('app/assets/images/kill_icon.png')
    @user = user
    mail(
      to: user.email,
      subject:"Success!!!!!"
    )do |format|
      format.html
    end
  end
end
