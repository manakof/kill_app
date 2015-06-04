class StaticPagesController < ApplicationController
  def home
    @medium = Medium.page(params[:page])
  end

  def hedden_page
  end
end
