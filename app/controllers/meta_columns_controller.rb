class MetaColumnsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :text => view_context.options_for_select(Report.table_columns(params[:id])) }
    end
  end
end
