class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  helper_method :current_torder

  def current_torder
    if !session[:torder_id].nil?
      Order.find(session[:order])
    end
  end
end
