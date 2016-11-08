class RecipesController < ApplicationController
  def new
  end

  def create
    if params[:video_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:video_id])         
      raise "Invalid upload signature" if !preloaded.valid?
      @model.video_id = preloaded.identifier
    end
  end

  def edit
  end

  def show
  end
end
