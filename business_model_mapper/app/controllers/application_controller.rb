class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!, except: [:home, :about, :contact]
    
    # def current_user
    #   current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    # end
  
    # def logged_in?
    #   !!current_user
    # end
end
