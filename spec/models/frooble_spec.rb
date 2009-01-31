require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Frooble do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :color => "value for color",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Frooble.create!(@valid_attributes)
  end
end
