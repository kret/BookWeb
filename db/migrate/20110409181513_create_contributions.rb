class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.string :role
      t.references :contributable, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
