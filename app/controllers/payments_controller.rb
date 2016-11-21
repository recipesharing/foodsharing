class PaymentsController < ApplicationController
  before_action :authenticate_user!


def create
  if @current_order.save_order(@current_user)
    flash[:success]="Your order has been successfully place"
   redirect_to root_path
 else 
  flash[:error]=" An error occured while saveing your order. "
end
