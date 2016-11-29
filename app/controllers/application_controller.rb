class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :load_cart
  before_action :current_user
  before_action :load_order
  helper_method :cart
  helper_method :order


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end


  def load_cart
    @cart ||= Cart.new(session[:cart])
  end

  def load_order
    session[:order] ||= {}
    @order ||= Order.new(session[:order])
    @order = Order.new if @order.present?
  end

  def cart
    @cart
  end

end
