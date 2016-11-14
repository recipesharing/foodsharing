class CommentsController < ApplicationController
  def create
    @comment = Recipe.find(params[:recipe_id]).comments.create(comment: params[:comment])
    respond_to do |format|
      format.json { render json: @comment }
      # format.html { redirect_to root_path }
      # format.js { render partial: 'comments/create', locals: { comment: @comment } }
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
