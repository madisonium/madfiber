class AddLatAndLngToPinsTable < ActiveRecord::Migration
  def self.up
    add_column :pins, :lat, :float
    add_column :pins, :lng, :float
  end

  def self.down
    remove_column :pins, :lng
    remove_column :pins, :lat
  end
end
