require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/froobles/show.html.erb" do
  include FrooblesHelper
  before(:each) do
    assigns[:frooble] = @frooble = stub_model(Frooble,
      :name => "value for name",
      :color => "value for color",
      :description => "value for description"
    )
  end

  it "should render attributes in <p>" do
    render "/froobles/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ color/)
    response.should have_text(/value\ for\ description/)
  end
end

