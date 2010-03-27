class CreateCabalMembers < ActiveRecord::Migration
  def self.up
    create_table :cabal_members do |t|
      t.string :name
      t.string :url
      t.string :business
      t.string :business_url
      t.string :image_url
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :cabal_members
  end
end
