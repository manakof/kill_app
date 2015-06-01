class UsersController < ApplicationController
  before_action :signed_in_user,only:[:show,:index,:edit,:update]
  before_action :correct_user, only:[:show,:edit,:update]
  before_action :admin_user, only: :destroy
  def new
    @user = TempUser.new
  end

  def index
    @users = User.all
  end

  def show
    @media = current_user.media.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def create
    temp_user = TempUser.find_by(email:params[:users][:email].downcase)
    if temp_user &&  temp_user.pass_key == params[:users][:pass_key]
      @user = User.new(name:temp_user.name,email:temp_user.email,password_digest:temp_user.password_digest)
      if @user.save
        temp_user.destroy
        info = UsersInfo.create(introduction:"Hi#{@user.name}! ")
        @user.users_info = info

        sign_in @user
        redirect_back_or @user
      else
        flash.now[:error] = '最初からやり直して下さい.'
        temp_user.destroy
       # @user = User.new
        render 'new'
      end

    else
      render 'new'
    end
    
  end

  def edit
  end

  def update
    redirect_to root_path
   # if @user.update_attributes(user_params)
   #   flash[:success]="Profile updated"
   #   redirect_to @user
   # else
   #   render 'edit'
   # end
  end
  private 
    
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    # Before actions
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path)unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
