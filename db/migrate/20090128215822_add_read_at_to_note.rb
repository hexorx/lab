class AddReadAtToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :read_at, :datetime
  end

  def self.down
    remove_column :notes, :read_at
  end
end
