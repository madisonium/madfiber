class Pin < ActiveRecord::Base
  scope :ok, where(:approved => true)
end
