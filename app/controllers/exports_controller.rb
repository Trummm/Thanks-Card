class ExportsController < ApplicationController
  def index
    csv = ExportCsvService.new User.all, User::CSV_ATTRIBUTES
    respond_to do |format|
      format.csv { send_data csv.perform,
        filename: "users.csv" }
    end
  end
end
