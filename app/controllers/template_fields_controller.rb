class TemplateFieldsController < ApplicationController
  inherit_resources
  belongs_to :report
  belongs_to :template

  def new
    build_resource
    render :edit
  end

  def create
    create! { edit_report_template_template_field_url(@report, @template, @template_field) }
  end

  def update
    update! { report_template_url(@report, @template) }
  end

  def destroy
    destroy! { report_template_url(@report, @template) }
  end
end
