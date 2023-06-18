module ApplicationHelper
  # rubocop:disable Rails/HelperInstanceVariable
  def current_user
    @current_user
  end
  # rubocop:enable Rails/HelperInstanceVariable

  def nav_classes(controller, action = nil)
    active = 'block py-2 pl-3 pr-4 rounded text-white bg-blue-700  md:bg-transparent md:text-blue-700 md:p-0'
    inactive = 'block py-2 pl-3 pr-4 rounded text-gray-900 hover:bg-gray-100 md:hover:bg-transparent md:border-0
                md:hover:text-blue-700 md:p-0'

    activate = action ? current_page?(controller:, action:) : controller_name == controller
    activate ? active : inactive
  end

  def svg(name)
    file_path = Rails.root.join("app/assets/images/#{name}.svg").to_s
    if File.exist?(file_path)
      File.read(file_path).html_safe
    else
      '(not found)'
    end
  end

  def proper_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end
end
