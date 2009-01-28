require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Note do
  fixtures :notes
  
  describe 'when created' do
    before do
      @note = nil
      @creating_note = lambda do
        @note = create_note
        violated "#{@note.errors.full_messages.to_sentence}" if @note.new_record?
      end
      @creating_note.call
      @note.reload
    end

    it 'should increment Note#count' do
      @creating_note.should change(Note, :count).by(1)
    end
    
    it do
      @note.should be_pending
    end
    
    it do
      @note.should_not be_read
    end
  end
  
  it 'requires to user' do
    lambda do
      n = create_note(:to_user_id => nil)
      n.errors.on(:to_user).should_not be_nil
    end.should_not change(Note, :count)
  end
  
  it 'requires from user' do
    lambda do
      n = create_note(:from_user_id => nil)
      n.errors.on(:from_user).should_not be_nil
    end.should_not change(Note, :count)
  end
  
protected
  def create_note(options = {})
    record = Note.create({
      :from_user_id => 1,
      :to_user_id => 1,
      :level => "value for level",
      :subject => "value for subject",
      :body => "value for body",
      :notable_type => "value for notable_type",
      :notable_id => 1
    }.merge(options))
  end
end
