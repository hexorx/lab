require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FrooblesController do

  def mock_frooble(stubs={})
    @mock_frooble ||= mock_model(Frooble, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all froobles as @froobles" do
      Frooble.should_receive(:find).with(:all).and_return([mock_frooble])
      get :index
      assigns[:froobles].should == [mock_frooble]
    end

    describe "with mime type of xml" do
  
      it "should render all froobles as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Frooble.should_receive(:find).with(:all).and_return(froobles = mock("Array of Froobles"))
        froobles.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested frooble as @frooble" do
      Frooble.should_receive(:find).with("37").and_return(mock_frooble)
      get :show, :id => "37"
      assigns[:frooble].should equal(mock_frooble)
    end
    
    describe "with mime type of xml" do

      it "should render the requested frooble as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Frooble.should_receive(:find).with("37").and_return(mock_frooble)
        mock_frooble.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new frooble as @frooble" do
      Frooble.should_receive(:new).and_return(mock_frooble)
      get :new
      assigns[:frooble].should equal(mock_frooble)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested frooble as @frooble" do
      Frooble.should_receive(:find).with("37").and_return(mock_frooble)
      get :edit, :id => "37"
      assigns[:frooble].should equal(mock_frooble)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created frooble as @frooble" do
        Frooble.should_receive(:new).with({'these' => 'params'}).and_return(mock_frooble(:save => true))
        post :create, :frooble => {:these => 'params'}
        assigns(:frooble).should equal(mock_frooble)
      end

      it "should redirect to the created frooble" do
        Frooble.stub!(:new).and_return(mock_frooble(:save => true))
        post :create, :frooble => {}
        response.should redirect_to(frooble_url(mock_frooble))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved frooble as @frooble" do
        Frooble.stub!(:new).with({'these' => 'params'}).and_return(mock_frooble(:save => false))
        post :create, :frooble => {:these => 'params'}
        assigns(:frooble).should equal(mock_frooble)
      end

      it "should re-render the 'new' template" do
        Frooble.stub!(:new).and_return(mock_frooble(:save => false))
        post :create, :frooble => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested frooble" do
        Frooble.should_receive(:find).with("37").and_return(mock_frooble)
        mock_frooble.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :frooble => {:these => 'params'}
      end

      it "should expose the requested frooble as @frooble" do
        Frooble.stub!(:find).and_return(mock_frooble(:update_attributes => true))
        put :update, :id => "1"
        assigns(:frooble).should equal(mock_frooble)
      end

      it "should redirect to the frooble" do
        Frooble.stub!(:find).and_return(mock_frooble(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(frooble_url(mock_frooble))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested frooble" do
        Frooble.should_receive(:find).with("37").and_return(mock_frooble)
        mock_frooble.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :frooble => {:these => 'params'}
      end

      it "should expose the frooble as @frooble" do
        Frooble.stub!(:find).and_return(mock_frooble(:update_attributes => false))
        put :update, :id => "1"
        assigns(:frooble).should equal(mock_frooble)
      end

      it "should re-render the 'edit' template" do
        Frooble.stub!(:find).and_return(mock_frooble(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested frooble" do
      Frooble.should_receive(:find).with("37").and_return(mock_frooble)
      mock_frooble.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the froobles list" do
      Frooble.stub!(:find).and_return(mock_frooble(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(froobles_url)
    end

  end

end
