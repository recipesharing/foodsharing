class CartsController < ApplicationController

  def index 
    @cart_recipes=session[:cart]
    @ordered_recipes= {}
    @total = 0
    @pickup_time =0
    @cart_item =0

    @cart_recipes.each do |recipe_id, quantity,price|
    recipe= Recipe.find_by_id(recipe_id)
    @ordered_recipes[recipe_id]={ recipe: recipe, quantity: quantity}
    
    end
  end

  def destroy 
    recipe_id=params[:id]
    @cart.cart_data.delete(recipe_id)
    redirect_to carts_path
  end

  def check_out
  end


  private 

end
