module AccommodationsHelper
  def conditional_booking_link_to(accommodation = nil, name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block_given?
    options ||= {}

    html_options = convert_options_to_data_attributes(options, html_options)

    url = url_for(options)
    html_options['href'] ||= url

    # TODO - check tier, available quantity, etc
    if (can_book(accommodation))
      content_tag(:a, name || url, html_options, &block)
    else
    end
  end

  def can_book(accommodation)
    # make sure user is logged in, has tier defined, and that the tier available has passed
    # make sure accommodation is not already already taken
    if (!logged_in? || !current_user.tier_id? || current_user.tier.available > DateTime.now || quantity_available?(accommodation) <= 0)
      return false
    end

    true
  end
end
