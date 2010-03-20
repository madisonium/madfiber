class Pin < ActiveRecord::Base
  include Geokit::Geocoders

  attr_accessor :do_not_geocode

  # validates :zip, :presence => true, :format => /\A\d{5}\z/, :unless => :do_not_geocode

  scope :ok, where(:approved => true).where('lat IS NOT NULL')
  before_save :update_lat_and_lng, :unless => :do_not_geocode

  def self.not_ok
    self.all - self.ok.all
  end
  def approve
    update_attribute :approved, true
  end

  def save_without_geocoding
    @do_not_geocode = true
    save
  end

  def latlng
    if lat.nil? || lng.nil?
      'nil, nil'
    else
      ('%0.4f' % lat.to_s) + (lat > 0 ? 'N, ' : 'S, ') +
        ('%0.4f' % lng.to_s) + (lng > 0 ? 'E' : 'W')
    end
  end

  def far?
    !close?
  end

  def close?
    return false if (lat.nil? || lng.nil?)
    lat_close = 43
    lng_close = -89.4
    delta = 1
    ((lat_close-delta) < self.lat && self.lat < (lat_close+delta)) &&
      ((lng_close-delta) < self.lng && self.lng < (lng_close+delta))
  end

private
  def update_lat_and_lng
    # addr = self.address + ', ' + self.zip
    result = MultiGeocoder.geocode(self.address)
    self.lat = result.lat
    self.lng = result.lng
  end
end
