module HomeHelper
  def nav_link_to(text, path)
    link_to text, path, class: ("active" if text.downcase == params[:action])
  end
end
