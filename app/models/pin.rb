class Pin < ActiveRecord::Base
  include Geokit::Geocoders

  attr_accessor :do_not_geocode

  validates :zip, :presence => true, :format => /\A\d{5}\z/, :unless => :do_not_geocode

  scope :ok, where(:approved => true)
  before_save :update_lat_and_lng, :unless => :do_not_geocode

  def approve
    update_attribute :approved, true
  end

  def save_without_geocoding
    @do_not_geocode = true
    save
  end

private
  def update_lat_and_lng
    # addr = self.address + ', ' + self.zip
    result = MultiGeocoder.geocode(self.address)
    self.lat = result.lat
    self.lng = result.lng
  end
end
