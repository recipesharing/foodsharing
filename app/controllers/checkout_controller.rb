class CheckoutController < ApplicationController
    protect_from_forgery :except => [:create]
  def show
    if user_signed_in?
      @order.ordered_recipes = session[:cart]["recipes"]
    else
      redirect_to root_path
    end
  end


  def create

      if @order.save_order(@current_user)
        session[:order] = {}
        session[:cart] = {}
        flash[:success] = "Your order has been successfully placed."
        # OrderWorker.perform_async(@current_user.id, @current_order.to_json)
        redirect_to root_path
      else
        flash[:error] = "An error occured while saving your order. Please try again."
        redirect_to cart_checkout_path
      end
  end
end

