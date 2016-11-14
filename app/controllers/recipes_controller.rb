class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def new
    @public_id = Time.now.to_f.to_s + rand(1000).to_s
    @countries = Country.all.map(&:name)
  end

  def create
    if params[:video_id].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:video_id])         
      raise "Invalid upload signature" if !preloaded.valid?
      @recipe = Recipe.new(video_id: preloaded.identifier, public_id: params[:public_id], description: params[:description])
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
    @recipe = Recipe.includes(:ingredients, :instructions, :comments).find(params[:id])
    @ingredients = @recipe.ingredients
    @instructions = @recipe.instructions.order(step: :ASC)
    @comments = if params[:page]
      @recipe.comments.page(params[:page]).per(10)
    else
      @recipe.comments.page(1).per(10)
    end
  end
end
