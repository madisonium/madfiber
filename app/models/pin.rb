class Pin < ActiveRecord::Base
  include Geokit::Geocoders

  validates :name, :presence => true
  validates :zip, :presence => true, :format => /\A\d{5}\z/

  scope :ok, where(:approved => true)
  before_save :update_lat_and_lng

  def approve
    update_attribute :approved, true
  end

private
  def update_lat_and_lng
    addr = self.address + ', ' + self.zip
    result = MultiGeocoder.geocode(address)
    self.lat = result.lat
    self.lng = result.lng
  end
end
