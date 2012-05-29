class FieldsController < ApplicationController
  inherit_resources
  belongs_to :report

  def new
    build_resource
    render :edit
  end

  def create
    create! { edit_field_url(@report, @field) }
  end

  def update
    update! { report_url(@report) }
  end
end
