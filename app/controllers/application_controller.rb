class ApplicationController < ActionController::Base
  include SessionsHelper

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
  end
end
