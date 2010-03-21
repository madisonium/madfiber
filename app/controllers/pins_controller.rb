class PinsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  before_filter :hide_sidebar


  respond_to :html

  def index
    @approved_pins = Pin.ok
    @unapproved_pins = Pin.not_ok
  end

  def show
    @pin = Pin.find_by_id(params[:id])
  end

  def edit
    @pin = Pin.find_by_id(params[:id])
  end

  def update
    @pin = Pin.find_by_id(params[:id])
    if params[:commit] == 'Delete'
      delete_pin
    else
      if @pin.update_attributes(params[:pin])
        flash[:notice] = 'Updated'
        redirect_to @pin
      else
        render :action => :edit
      end
    end
  end

  def destroy
    @pin = Pin.find_by_id(params[:id])
    delete_pin
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

private

  def delete_pin
    if @pin.destroy
      flash[:notice] = 'deleted'
      redirect_to pins_path
    else
      flash[:notice] = 'could not delete'
      render :action => :show
    end
  end
end
