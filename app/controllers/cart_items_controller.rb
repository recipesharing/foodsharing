class CartItemsController < ApplicationController
  def create
    @cart.increment(params[:recipe_id])
    session[:cart] = @cart.cart_data
    redirect_to recipes_path
  end

  def destroy
    @cart.destroy
    session.delete(:cart)
  end

  def delete
    @cart.delete(:recipe_id)
  end

  def update
    cart = cart_params
    recipe_id = cart[:recipe_id]
    quantity = cart[:quantity]
    session[:cart][food_id] = quantity.to_i
    session[:order]["recipes"][recipe_id]["quantity"] = quantity.to_i
    session[:order]["details"] = order_params
    render json: {data: recipe_id}
  end


  def increment(recipe_id)
    @cart_data[recipe_id] ||= 0
    increment_cart_recipe_by_one(recipe_id)
  end

  def destroy
    @cart_data = nil
  end

  def delete
    @cart_data[recipe_id] = 0
  end

  private

  def increment_cart_recipe_by_one(recipe_id)
    @cart_data[recipe_id] += 1
  end
  
end
