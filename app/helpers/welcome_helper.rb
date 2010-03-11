module WelcomeHelper
  def pins_to_js pins
    pins.map do |pin|
      {:lat => pin.lat, :lng => pin.lng, :title => pin.name}
    end.to_json
  end
end
