class CommentsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    if current_user != nil
      @comment = recipe.comments.create(comment: params[:comment])
      respond_to do |format|
        format.json { render json: @comment }
      end
    else
      redirect_to recipe, flash: { alert: "login to leave your review!" }
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
  end

  def render_comment(comment)
    ApplicationController.render(
      partial: 'comments/comment',
      locals: { comment: comment }
    )
  end
end
