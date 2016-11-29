# controller vote recipes
class ShortListsController < ApplicationController
  before_action :authenticate_user!

  def create
    flash[:notice] = 'please login to like recipe' unless current_user.present?
    @user = current_user
    @recipe = Recipe.find(params[:recipe])
    if current_user.voted_for? @recipe
      @recipe.unliked_by current_user
    else
      @recipe.liked_by current_user
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def destroy
  end
end
