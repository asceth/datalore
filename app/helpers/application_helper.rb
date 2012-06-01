module ApplicationHelper

  def icon(name, options = {})
    options[:class] = (options[:class] || '') + " #{name}"
    content_tag(:i, '', options)
  end

  def link_to_add_fields(name, f, association, view_directory = '', options = {})
    reflection = f.object.class.reflect_on_association(association)

    new_object = unless reflection.options[:as].blank?
                   reflection.build_association(reflection.options[:as] => f.object)
                 else
                   reflection.build_association(f.object.class.to_s.downcase => f.object)
                 end


    fields = f.simple_fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(view_directory + "fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", options)
  end
end
