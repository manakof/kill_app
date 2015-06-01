class MediaController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy
  def create
    
    @medium = current_user.media.build(media_params)
    if @medium.save
     flash[:success]="posted!"
      redirect_to user_path(current_user)
    else
      render user_path(current_user)
    end
    
  end

  def destroy
    @medium.destroy
    redirect_to user_path(current_user)
  end

  private 

    def media_params
      params.require(:medium).permit(:content,:media_id)
    end

    def correct_user
      @medium = current_user.media.find_by(id: params[:id])
      redirect_to(root_path) if @medium.nil?
    end
end
