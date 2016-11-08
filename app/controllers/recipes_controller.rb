class RecipesController < ApplicationController
  def new
    @public_id = Time.now.to_f.to_s + rand(1000).to_s
  end

  def create
    if params[:video_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:video_id])         
      raise "Invalid upload signature" if !preloaded.valid?
      @recipe = Recipe.new(video_id: preloaded.identifier)
      if @recipe.save
        flash[:success] = "recipe created successfully!"
      else
        flash[:alert] = @recipe.errors.full_messages.to_sentence
      end
    end
  end

  def edit
  end

  def show
  end
end
