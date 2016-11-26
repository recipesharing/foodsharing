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
    food_id = cart[:recipe_id]
    quantity = cart[:quantity]
    session[:cart][food_id] = quantity.to_i
    session[:order]["items"][recipe_id]["qty"] = quantity.to_i
    session[:order]["details"] = order_params
    render json: {data: recipe_id}
  end
end
