class Pin < ActiveRecord::Base
  validates :name, :presence => true
  validates :zip, :presence => true, :format => /\A\d{5}\z/

  scope :ok, where(:approved => true)
  before_save :update_lat_and_lng

private
  def update_lat_and_lng
    
  end
end
