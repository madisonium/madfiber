class ApplicationController < ActionController::Base
  protect_from_forgery

protected
  def hide_sidebar
    @hide_sidebar = true
  end
end
