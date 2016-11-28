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


  def edit_status
    recipe = Recipe.find(recipe_params[:id].to_i)
    unless recipe.nil?
      status = recipe_params[:status] == "true" ? "available" : "not available"
      recipe.status = status
      recipe.save
      # render json: recipe
    end
  end

  def show
    @recipe = Recipe.includes(:ingredients, :instructions, :comment_threads).find_by_id(params[:id])
    if @recipe.present?
      @ingredients = @recipe.ingredients
      @instructions = @recipe.instructions.order(step: :ASC)
      @comments = if params[:page]
        @recipe.root_comments.page(params[:page]).per(10)
      else
        @recipe.root_comments.page(1).per(10)
      end
    else
      # Todo: handling by raise record not found
      redirect_to root_path
    end
  end

  private 
   def recipe_params
    params.require(:recipe).permit(:id, :name, :description, :price,
                                 , :country_id, :status)
  end
end
