class TempUsersController < ApplicationController
  def new
    @user = TempUser.new
  end

  def create
    @user = TempUser.new(user_params)
    @usr = User.find_by(email:params[:temp_user][:email].downcase)
    if !@usr
      if @user.save
        redirect_to new_user_path
      @mail = UserMailer.confirmation(@user)
      @my_mail = MyMailer.connection(@user)
      @mail.deliver
      @my_mail.deliver
      
      else 
        render 'new'
      end
    elsif @usr
      flash.now[:error] = 'email is taken'
      render 'new'
    end
  end

  private

    def user_params
      params.require(:temp_user).permit(:name,:email,:password,:password_comfirmation)
    end
end
