class TemplatesController < ApplicationController
  inherit_resources
  belongs_to :report

  def new
    @template = parent.build_default_template
    render :action => 'show'
  end

  def show
    parent.conceptualize(:current_user => current_user.id) if respond_to?(:current_user)
    show!
  end
end
