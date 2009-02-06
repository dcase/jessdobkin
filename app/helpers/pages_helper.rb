module PagesHelper
  # Renders the value of the specified object and method with in-place editing capabilities.
   def in_place_editor_field(object, method, tag_options = {}, in_place_editor_options = {})
     tag = ::ActionView::Helpers::InstanceTag.new(object, method, self)
     tag_options = {:tag => "div", :id => "#{object}_#{method}_#{tag.object.id}_in_place_editor", :class => "in_place_editor_field"}.merge!(tag_options)
     in_place_editor_options[:url] = in_place_editor_options[:url] || url_for({ :action => "set_#{object}_#{method}", :id => tag.object.id })
     tag.to_content_tag(tag_options.delete(:tag), tag_options) +
     in_place_editor(tag_options[:id], in_place_editor_options)
   end
end
