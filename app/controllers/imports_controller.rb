class ImportsController < ApplicationController
  before_action :load_notification, only: %i[index destroy show edit update new approved_index]

  def index
    @import = User.new
  end

  def edit; end

  def create
    @import = User.import_file params[:file]
    redirect_to dashboard_path
  end

  private 
  def load_notification
    @activities = PublicActivity::Activity.order('created_at DESC').limit(10)
  end
end
