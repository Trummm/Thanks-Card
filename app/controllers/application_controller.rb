class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SessionsHelper
  include PublicActivity::StoreController
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # end
    
  private
  def record_not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
