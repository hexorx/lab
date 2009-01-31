require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/froobles/index.html.erb" do
  include FrooblesHelper
  
  before(:each) do
    assigns[:froobles] = [
      stub_model(Frooble,
        :name => "value for name",
        :color => "value for color",
        :description => "value for description"
      ),
      stub_model(Frooble,
        :name => "value for name",
        :color => "value for color",
        :description => "value for description"
      )
    ]
  end

  it "should render list of froobles" do
    render "/froobles/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for color".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end

