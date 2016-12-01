# application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  helper_method :current_torder
  helper_method :prepare_recipes


  def current_torder
    if !session[:torder_id].nil?
      Torder.find(session[:torder_id])
    else
      Torder.new
    end
  end

  def prepare_recipes
    @recipes = if params[:search]
                 Recipe.filter(params).search(params)
               else
                 Recipe.all
               end

    if params['sort']
      params['sort'].split(',').each do |sort|
        sort = sort.split('/')
        @recipes = @recipes.order_name(sort[1]) if sort[0] == 'name'
        @recipes = @recipes.order_cook_time(sort[1]) if sort[0] == 'cooking time'
      end
    end
    @tag_names = Recipe.all_tags(&:name)
    return unless params['tags']
    @recipes = @recipes.tagged_with params['tags']
  end
end
