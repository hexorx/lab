require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/froobles/new.html.erb" do
  include FrooblesHelper
  
  before(:each) do
    assigns[:frooble] = stub_model(Frooble,
      :new_record? => true,
      :name => "value for name",
      :color => "value for color",
      :description => "value for description"
    )
  end

  it "should render new form" do
    render "/froobles/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", froobles_path) do
      with_tag("input#frooble_name[name=?]", "frooble[name]")
      with_tag("input#frooble_color[name=?]", "frooble[color]")
      with_tag("textarea#frooble_description[name=?]", "frooble[description]")
    end
  end
end


