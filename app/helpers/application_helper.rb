module ApplicationHelper

  def icon(name, options = {})
    options[:class] = (options[:class] || '') + " #{name}"
    content_tag(:i, '', options)
  end
end
