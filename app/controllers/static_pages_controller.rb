class StaticPagesController < ApplicationController
  before_action :set_page

  private

  def set_page
    @page = params[:action]
  end
  
end
