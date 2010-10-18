require "spec_helper"

describe FixesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/fixes" }.should route_to(:controller => "fixes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fixes/new" }.should route_to(:controller => "fixes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fixes/1" }.should route_to(:controller => "fixes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fixes/1/edit" }.should route_to(:controller => "fixes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fixes" }.should route_to(:controller => "fixes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/fixes/1" }.should route_to(:controller => "fixes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fixes/1" }.should route_to(:controller => "fixes", :action => "destroy", :id => "1")
    end

  end
end
