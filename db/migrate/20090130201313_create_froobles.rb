class CreateFroobles < ActiveRecord::Migration
  def self.up
    create_table :froobles do |t|
      t.string :name
      t.string :color
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :froobles
  end
end
