require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/notes/new.html.erb" do
  include NotesHelper
  
  before(:each) do
    assigns[:note] = stub_model(Note,
      :new_record? => true,
      :from_user_id => 1,
      :to_user_id => 1,
      :level => "value for level",
      :subject => "value for subject",
      :body => "value for body",
      :notable_type => "value for notable_type",
      :notable_id => 1
    )
  end

  it "should render new form" do
    render "/notes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", notes_path) do
      with_tag("input#note_from_user_id[name=?]", "note[from_user_id]")
      with_tag("input#note_to_user_id[name=?]", "note[to_user_id]")
      with_tag("input#note_level[name=?]", "note[level]")
      with_tag("input#note_subject[name=?]", "note[subject]")
      with_tag("input#note_body[name=?]", "note[body]")
      with_tag("input#note_notable_type[name=?]", "note[notable_type]")
      with_tag("input#note_notable_id[name=?]", "note[notable_id]")
    end
  end
end


