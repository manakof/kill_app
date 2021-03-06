class UsersInfoController < ApplicationController
  before_action :signed_in_user, only: [:edit,:update]
  before_action :correct_user,only: [:edit,:update]
  before_action :admin_user, only: :destroy

  def edit
    #users_info modelが作られていないなら作成

  end

  def create
    redirect_to root_path
  end
  def update
    if @user.users_info.update_attributes(user_params)
      flash[:success]="Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
      @users_info = UsersInfo.find(params[:id]) 
      @media = User.find_by(id:params[:id]).media.page(params[:page])
  end

  private
    
    def user_params
      params.require(:users_info).permit(:photo,:introduction)
    end
   
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice:"Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path)unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
