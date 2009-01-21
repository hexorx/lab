require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Note do
  before(:each) do
    @valid_attributes = {
      :from_user_id => 1,
      :to_user_id => 1,
      :level => "value for level",
      :subject => "value for subject",
      :body => "value for body",
      :notable_type => "value for notable_type",
      :notable_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Note.create!(@valid_attributes)
  end
end
