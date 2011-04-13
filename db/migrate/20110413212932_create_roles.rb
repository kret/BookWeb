class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    rename_column :contributions, :role, :role_id
  end

  def self.down
    drop_table :roles
    rename_column :contributions, :role_id, :role
  end
end
