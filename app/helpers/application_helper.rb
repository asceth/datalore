module ApplicationHelper

  def icon(name, options = {})
    options[:class] = (options[:class] || '') + " #{name}"
    content_tag(:i, '', options)
  end

  def text_with_icon(text, name, options = {})
    content_tag(:span, icon(name, options) + " " + text)
  end

  def link_to_add_nested(name, f, association, options = {})
    partial = options.delete(:partial) || "#{association}/fields"
    locals = options.delete(:locals) || {}
    build_options = options.delete(:build) || {}
    target = options.delete(:target) || "#new_#{association}"

    reflection = f.object.class.reflect_on_association(association)

    unless reflection.options[:as].blank?
      build_options[reflection.options[:as]] = f.object
    else
      build_options[f.object.class.to_s.downcase] = f.object
    end

    new_object = reflection.build_association(build_options)


    fields = f.simple_fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(partial, {:f => builder}.merge(locals))
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{target}\", \"#{escape_javascript(fields)}\")", options)
  end
end
