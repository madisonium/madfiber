class WelcomeController < ApplicationController

  def down_payment
  end

  def hi
    @pin = Pin.new
    @pins = Pin.ok
  end

  def supporters
    @cabal_members = CabalMember.all
  end

end
