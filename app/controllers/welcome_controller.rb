class WelcomeController < ApplicationController
  def hi
    @pin = Pin.new
    # @pins = Pin.ok
  end
end
