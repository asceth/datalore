class MetaColumnsController < ApplicationController
  def index
    respond_to do |format|
      format.json { Report.table_columns(params[:table_name] || params[:table]).to_json }
    end
  end
end
