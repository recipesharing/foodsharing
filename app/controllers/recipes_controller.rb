# recipes controller
# upgrate randome generator with securerandom
require 'securerandom'

# recipes conroller
class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def new
    @public_id = SecureRandom.hex(20)
    @countries = Country.all
    # @countries = Country.all.map(&:name)
  end

  def create
    return unless params[:video_id].present?
    preloaded = Cloudinary::PreloadedFile.new(params[:video_id])
    raise 'Invalid upload signature' unless preloaded.valid?
    @recipe = Recipe.new(video_id: preloaded.identifier,
                         public_id: params[:public_id],
                         country: Country.find(params[:cuisine]),
                         description: params[:description],
                         background_image: params[:image_background_id],
                         name: params[:name],
                         background_name: params[:background_name],
                         short_description: params[:short_description])
    if @recipe.save
      create_instructions
      flash[:success] = 'recipe created successfully!'
      redirect_to @recipe
    else
      flash[:alert] = @recipe.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def edit
  end

  def show
    @recipe = Recipe.includes(:ingredients, :instructions,
                              :comment_threads).find_by_id(params[:id])
    if @recipe.present?
      prepare_recipes
    else
      # TODO: handling by raise record not found
      redirect_to root_path
    end
  end

  private

  def create_instructions
    instructions = JSON.parse(URI.decode(params[:instruction]))
    instructions.each_with_index do |instruction, i|
      Instruction.create(
        step: i + 1,
        image_url: instruction['public_id'],
        title: instruction['title'],
        content: instruction['content'],
        recipe: @recipe
      )
    end
  end

  def prepare_recipes
    @ingredients = @recipe.ingredients
    @instructions = @recipe.instructions.order(step: :ASC)
    @comments = if params[:page]
                  @recipe.root_comments.page(params[:page]).per(10)
                else
                  @recipe.root_comments.page(1).per(10)
                end
  end
end
