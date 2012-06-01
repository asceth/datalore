class FieldsController < ApplicationController
  inherit_resources
  belongs_to :report

  def new
    build_resource
    respond_to do |format|
      format.html { render :edit }
      format.js { render :edit }
    end
  end

  def create
    create! { edit_report_field_url(@report, @field) }
  end

  def update
    update! { report_url(@report) }
  end

  def destroy
    destroy! { report_url(@report) }
  end
end
