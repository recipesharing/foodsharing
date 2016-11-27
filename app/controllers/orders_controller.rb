class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    # @user = User.find(params[:user_id])
    @orders = current_user.orders
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

end
