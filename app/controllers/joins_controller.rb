class JoinsController < ApplicationController
  inherit_resources
  belongs_to :report

  def new
    build_resource
    render :edit
  end

  def create
    create! { edit_report_join_url(@report, @join) }
  end

  def update
    update! { report_url(@report) }
  end

  def destroy
    destroy! { report_url(@report) }
  end
end
