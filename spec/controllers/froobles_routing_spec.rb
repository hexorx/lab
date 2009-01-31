require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FrooblesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "froobles", :action => "index").should == "/froobles"
    end
  
    it "should map #new" do
      route_for(:controller => "froobles", :action => "new").should == "/froobles/new"
    end
  
    it "should map #show" do
      route_for(:controller => "froobles", :action => "show", :id => 1).should == "/froobles/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "froobles", :action => "edit", :id => 1).should == "/froobles/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "froobles", :action => "update", :id => 1).should == "/froobles/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "froobles", :action => "destroy", :id => 1).should == "/froobles/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/froobles").should == {:controller => "froobles", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/froobles/new").should == {:controller => "froobles", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/froobles").should == {:controller => "froobles", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/froobles/1").should == {:controller => "froobles", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/froobles/1/edit").should == {:controller => "froobles", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/froobles/1").should == {:controller => "froobles", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/froobles/1").should == {:controller => "froobles", :action => "destroy", :id => "1"}
    end
  end
end
