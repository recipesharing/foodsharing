class CommentsController < ApplicationController
  include CanCan::Ability
  before_action :authenticate_user!

  def create
    recipe = Recipe.find(params[:recipe_id])
    # this is root comment
    @comment = Comment.build_from(recipe, current_user.id, params[:comment]) if current_user.present?
    # move to child
    # save
    @comment.save
    respond_to do |format|
      format.html { render html: render_comment(@comment) }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.present?
      comment.destroy
    end
    
  end

  def render_comment(comment)
    ApplicationController.render(
      partial: 'comments/comment',
      locals: { comment: comment }
    )
  end
end
