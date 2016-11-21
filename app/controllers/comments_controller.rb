class CommentsController < ApplicationController
  include CanCan::Ability

  def create
    recipe = Recipe.find(params[:recipe_id])
    # this is root comment
    @comment = Comment.build_from(recipe, current_user, params[:comment]) if current_user.present?
    # move to child
    # save
    @comment.save
    respond_to do |format|
      format.json { render json: @comment }
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
