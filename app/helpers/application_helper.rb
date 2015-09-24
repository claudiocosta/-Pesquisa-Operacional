module ApplicationHelper
  def nav_active_btn(btn, path)
    if current_page? path
      content_tag :li, link_to(btn,'#'), :class => 'active'
    else
      content_tag :li, link_to(btn, path)
    end
  end
end
