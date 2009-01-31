require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/froobles/edit.html.erb" do
  include FrooblesHelper
  
  before(:each) do
    assigns[:frooble] = @frooble = stub_model(Frooble,
      :new_record? => false,
      :name => "value for name",
      :color => "value for color",
      :description => "value for description"
    )
  end

  it "should render edit form" do
    render "/froobles/edit.html.erb"
    
    response.should have_tag("form[action=#{frooble_path(@frooble)}][method=post]") do
      with_tag('input#frooble_name[name=?]', "frooble[name]")
      with_tag('input#frooble_color[name=?]', "frooble[color]")
      with_tag('textarea#frooble_description[name=?]', "frooble[description]")
    end
  end
end


