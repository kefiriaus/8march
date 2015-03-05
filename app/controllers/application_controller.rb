class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_filter :app_initialization

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def app_initialization
    if is_browser_unsupported?
      render "welcome/browser", :status => 406, :layout => true
    end
  end
end
