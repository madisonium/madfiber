class PinsController < ApplicationController
  respond_to :html
  def create
    @pin = Pin.new(params[:pin])
    if @pin.save
      flash[:notice] = 'Pin added to approval queue!'
      respond_with(@pin, :location => root_url)
    else
      render :action => '/welcome/hi'
    end
  end
end
