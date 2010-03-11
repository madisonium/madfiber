class CreatePins < ActiveRecord::Migration
  def self.up
    create_table :pins do |t|
      t.string :name
      t.string :address
      t.string :zip
      t.boolean :approved

      t.timestamps
    end
  end

  def self.down
    drop_table :pins
  end
end
