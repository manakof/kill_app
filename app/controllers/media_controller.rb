class MediaController < ApplicationController
  before_action :signed_in_user, only: [:destroy,:edit,:update,:create]
  before_action :correct_user, only: [:destroy,:edit,:update]

  require 'twitter'

  def create
  
    @medium = current_user.media.build(media_params)
    if @medium.save

    client = Twitter::REST::Client.new do |config|
       config.consumer_key = Rails.application.secrets.twitter_consumer_key 
       config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
       config.access_token = Rails.application.secrets.twitter_access_token
       config.access_token_secret = Rails.application.secrets.twitter_access_secret 
     end
      client.update(current_user.name++" posted content! "++" https://kill-app.herokuapp.com/ ")

      flash[:success]="posted!"
      redirect_to user_path(current_user)
    else
      redirect_to  user_path(current_user)
    end
    
  end
 
  def edit
  end
  
  def update
   @medium.update_attributes(media_params)
   redirect_to edit_medium_path params[:id]
  end

  def destroy
    @medium.destroy
    redirect_back_or root_path
  end

  def conttyp
    @media = Medium.where(media_id:params[:id]).page(params[:page]).per(12)
  end


  private 

    def media_params
      params.require(:medium).permit(:content,:media_id,:title)
    end

    def correct_user
      if current_user.admin?
        @medium = Medium.find_by(id: params[:id]) 
      else
        @medium = current_user.media.find_by(id:params[:id])
      end
      redirect_to(root_path) if @medium.nil?
    end
end
