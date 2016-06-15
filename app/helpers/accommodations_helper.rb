module AccommodationsHelper
  def conditional_link_to(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block_given?
    options ||= {}

    html_options = convert_options_to_data_attributes(options, html_options)

    url = url_for(options)
    html_options['href'] ||= url

    # TODO - check tier, available quantity, etc
    if (false)
      content_tag(:a, name || url, html_options, &block)
    else
    end
  end
end
