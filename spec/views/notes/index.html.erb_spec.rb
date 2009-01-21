require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/notes/index.html.erb" do
  include NotesHelper
  
  before(:each) do
    assigns[:notes] = [
      stub_model(Note,
        :from_user_id => 1,
        :to_user_id => 1,
        :level => "value for level",
        :subject => "value for subject",
        :body => "value for body",
        :notable_type => "value for notable_type",
        :notable_id => 1
      ),
      stub_model(Note,
        :from_user_id => 1,
        :to_user_id => 1,
        :level => "value for level",
        :subject => "value for subject",
        :body => "value for body",
        :notable_type => "value for notable_type",
        :notable_id => 1
      )
    ]
  end

  it "should render list of notes" do
    render "/notes/index.html.erb"
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for level".to_s, 2)
    response.should have_tag("tr>td", "value for subject".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", "value for notable_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

