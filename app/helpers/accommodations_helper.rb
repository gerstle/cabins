module AccommodationsHelper
  def can_book(accommodation)
    # make sure user is logged in, has tier defined, and that the tier available has passed
    # make sure accommodation is not already already taken
    if (!logged_in? || (!current_user.tier_id? && !is_admin? ) || (!is_admin? && current_user.tier.available > DateTime.now) || quantity_available?(accommodation) <= 0)
      return false
    end

    true
  end

  def sortable(column, help_text, direction)
    title ||= column + ": " + help_text
    link_to title, params.permit(:sort, :direction).merge(:sort => column, :direction => direction, :page => nil), :remote => true
  end
end
