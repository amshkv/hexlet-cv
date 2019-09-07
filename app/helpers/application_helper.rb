# frozen_string_literal: true

module ApplicationHelper
  # include AuthManagement

  def han(model_name, attribute_name)
    model_name.classify.constantize.human_attribute_name(attribute_name)
  end

  def markdown2html(text)
    extensions = {
      autolink: true,
      filter_html: true,
      safe_links_only: true
    }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)
    markdown.render(text)
  end

  def active?(path, options = {})
    # raise options.inspect
    if options.key? :active_if
      'active' if options[:active_if]
    elsif current_page?(path)
      'active'
    end
  end

  def navbar_menu_item(name, path = '#')
    options = { class: "nav-link #{active?(path)}" }
    content_tag :li, class: 'nav-item' do
      link_to path, options do
        content_tag(:div, name)
      end
    end
  end
end
