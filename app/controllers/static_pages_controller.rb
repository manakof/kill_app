class StaticPagesController < ApplicationController
  def home
    @media = Medium.page(params[:page])
  end

  def hedden_page
  end
end
