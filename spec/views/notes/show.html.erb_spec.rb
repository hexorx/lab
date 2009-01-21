require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/notes/show.html.erb" do
  include NotesHelper
  before(:each) do
    assigns[:note] = @note = stub_model(Note,
      :from_user_id => 1,
      :to_user_id => 1,
      :level => "value for level",
      :subject => "value for subject",
      :body => "value for body",
      :notable_type => "value for notable_type",
      :notable_id => 1
    )
  end

  it "should render attributes in <p>" do
    render "/notes/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ level/)
    response.should have_text(/value\ for\ subject/)
    response.should have_text(/value\ for\ body/)
    response.should have_text(/value\ for\ notable_type/)
    response.should have_text(/1/)
  end
end

