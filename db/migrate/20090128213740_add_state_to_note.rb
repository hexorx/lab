class AddStateToNote < ActiveRecord::Migration
  def self.up
    add_column :notes, :state, :string
  end

  def self.down
    remove_column :notes, :state
  end
end
