class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    create_table :roles_users, :id => false do |t|
      t.references :role
      t.references :user
    end
    add_index :roles_users, [:role_id, :user_id]
    add_index :roles_users, [:user_id, :role_id]
  end

  def self.down
    remove_index :roles_users, :column => [:user_id, :role_id]
    remove_index :roles_users, :column => [:role_id, :user_id]
    drop_table :roles_users
    drop_table :roles
  end
end
