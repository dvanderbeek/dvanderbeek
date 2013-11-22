module HomeHelper
  def nav_link_to(text, path, action="")
    action = action.blank? ? text.downcase : action
    link_to text, path, class: ("active" if current_page?(action: action))
  end
end