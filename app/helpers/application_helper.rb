# frozen_string_literal: true

module ApplicationHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    resource.errors.full_messages.map do |msg|
      content_tag(:li, msg)
    end.join
    html = <<~HTML
      <div class="alert alert-error alert-danger">
        <a href='#' class='close' data-dismiss='alert' &#215;></a>
        <%= content_tag :div, msg if msg.is_a?(String) %>
      </div>
HTML
    html.html_safe
  end
end
