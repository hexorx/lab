class Note < ActiveRecord::Base
  include AASM
  
  aasm_column :state
  aasm_initial_state :pending
  
  aasm_state :pending
  
  belongs_to :to_user, :class_name => "User", :foreign_key => "to_user_id"
  belongs_to :from_user, :class_name => "User", :foreign_key => "from_user_id"
  
  validates_presence_of :to_user, :on => :create, :message => "can't be blank"
  validates_presence_of :from_user, :on => :create, :message => "can't be blank"
  
  def read?
    !read_at.blank?
  end
end
