class PinsController < ApplicationController
  resource_controller
  create.wants.html { redirect_to hi_welcome_path }
end
