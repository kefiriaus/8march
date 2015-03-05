module ApplicationHelper

  Browser = Struct.new(:browser, :version)
  UNSUPPORTED_BROWSERS = [
    Browser.new("Internet Explorer", "8.0"),
  ]

  SUPPORTED_BROWSERS = []

  def is_browser_unsupported?
    return false if (Rails.env.test? and request.user_agent.blank?)
    @user_agent = UserAgent.parse(request.user_agent)
    #return true if UNSUPPORTED_BROWSERS.include?(@user_agent.browser)
    return true if UNSUPPORTED_BROWSERS.any? { |browser| @user_agent <= browser }
    false
  end

end
