class TcartsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout]
  before_action :prepare_user, only: [:index, :show, :checkout]
  
  def index
    @torder_items = current_torder.torder_items
    # @user = current_user
  end 

  def show
    @torder_items = current_torder.torder_items
  end

  def checkout
    # @user = current_user
    @torder = Torder.new
    @torder_items = current_torder.torder_items
    if current_user.nil?
      flash[:warning]="please sign in "
    else 
      @torder_items = current_torder.torder_items
      @total_price_each_item = @torder_items.map(&:total_price)
      sum = 0 
      @total_all  = @total_price_each_item.inject(0){|sum,x| sum + x } 
    end
  end

  def create
    @torder_items = current_torder.torder_items
    current_torder.update(total: @torder_items.map(&:total_price).sum, user: current_user)
    @torder_items.each { |t| t.save}
    session[:torder_id] = nil
    redirect_to cook_books_path
    flash[:success] = " Thanks for shopping with us "
      # end
  end 

  private
    def user_params
      params.permit(:email, :phone, :address, :firstname, :lastname)
    end

    def torder_item_params
      params.require(:torder_item).permit( :quantity, :recipe_id)
    end

    def prepare_user
      @user = current_user if user_signed_in?
    end
end




