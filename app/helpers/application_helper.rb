module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "#{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), :remote => true, :class => css_class
  end

  def user_has_reservation
    Reservation.find_by_user_id(current_user.id).nil? ? false : true
  end

  def mobile_device?
   if session[:mobile_param]
     session[:mobile_param] == "1"
   else
     request.user_agent =~ /Mobile|webOS/
   end
  end
end
