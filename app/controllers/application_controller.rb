class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SessionsHelper
  include PublicActivity::StoreController
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::ActiveRecordError, with: :errors_exception

  private
  def record_not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end

  def errors_exception
    render file: "#{Rails.root}/public/exception.html", layout: false, status: :not_found
  end
end
