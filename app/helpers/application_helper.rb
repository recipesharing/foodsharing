module ApplicationHelper
  
  def current_user
    if session[:user_id]
      @current_user||= User.find_by_id session[:user_id]
    end 
  end
 
  def authenticate_user!
    redirect_to root_path unless current_user
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  def recipe_in_cart
    recipes = 0
    if !session[:cart].nil? && session[:cart].length > 0
      session[:cart].each do |_key, value|
        recipes += value
      end
    end 
  end
   
  def this_recipe_in_cart(recipe)
    recipe_count = 0;
    if !session.nil? ||session[:cart].empty?
      recipes_count = session[:cart][recipe.id.to_s].nil? ? 0 : ssession[:cart][recipe.id.to_s]
    end
  end


  def cart_properties
    cart_properties = {}
        if session[:cart].nil? || session[:cart].empty?
            cart_properties["recipes_count"] = 0
            cart_properties["status"]= "empty"
        else
            cart_properties["recipe_count"]= recipes_in_cart
            cart_properties["status"] = "not-empty"
        end
      cart_properties
  end
end
