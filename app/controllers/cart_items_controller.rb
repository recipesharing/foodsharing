class CartItemsController < ApplicationController
  def create
    @cart.increment(params[:recipe_id])
    session[:cart] = @cart.cart_data
    redirect_to cook_books_path

  end

  def destroy
    #debugger
    # @cart.delete(params[:recipe_id])
    @cart.delete(params[:id])
    redirect_to :back
     # @cart.destroy
     # session.delete(:cart)

  end


  def update
    cart = cart_params
    recipe_id = cart[:recipe_id]
    quantity = cart[:quantity]
    session[:cart][recipe_id] = quantity.to_i
    session[:order]['ecipes'][recipe_id]['quantity'] = quantity.to_i
    session[:order]['details'] = order_params
    render json: {data: recipe_id}
  end


  def increment(recipe_id)
    @cart_data[recipe_id] ||= 0
    @cart_data[recipe_id] += 1
  end

  

end
