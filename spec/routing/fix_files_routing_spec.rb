require "spec_helper"

describe FixFilesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/fix_files" }.should route_to(:controller => "fix_files", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fix_files/new" }.should route_to(:controller => "fix_files", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fix_files/1" }.should route_to(:controller => "fix_files", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fix_files/1/edit" }.should route_to(:controller => "fix_files", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fix_files" }.should route_to(:controller => "fix_files", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/fix_files/1" }.should route_to(:controller => "fix_files", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fix_files/1" }.should route_to(:controller => "fix_files", :action => "destroy", :id => "1")
    end

  end
end
