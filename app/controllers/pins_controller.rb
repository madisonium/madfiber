class PinsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html
  def index
    @unapproved_pins = Pin.not_ok
    @approved_pins = Pin.ok
  end
  def add_madison
    @pin = Pin.find(params[:id])
    flash[:notice] = @pin.update_attributes(:address => @pin.address + ", Madison, WI", :approved => true) ? 'ok' : "eek: #{@pin.errors}"
    redirect_to pins_path
  end
  def approve
    @pin = Pin.find(params[:id])
    flash[:notice] = @pin.update_attributes(:approved => true) ? 'ok' : "eek: #{@pin.errors}"
    redirect_to pins_path
  end
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
