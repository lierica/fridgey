class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!current_fridge
  end

  def current_fridge
    @current_fridge ||= Fridge.find(session[:fridge_id]) if session[:fridge_id]
  end

end
