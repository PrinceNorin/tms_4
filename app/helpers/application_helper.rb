module ApplicationHelper
  def full_title(title)
    base_title = "Training System"
    if title.blank?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#",
          onclick: "remove_fields(this)", remote: true)
  end
  
  def link_to_add_field(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for association, new_object, child_index: "new_#{association}" do |builder|
      render association.to_s.singularize + "_field", f: builder
    end
    link_to(name, "#", class: "btn btn-primary form-control", onclick: "add_fields(this, \"#{association}\",
                    \"#{escape_javascript(fields)}\")", remote: true)
  end
end
