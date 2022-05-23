class ApplicationController < ActionController::Base
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
 
  private
  def record_not_found
    render plain: "404 Not Found", status: 404
  end
end
