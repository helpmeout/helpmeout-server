require 'spec_helper'

describe FixFilesController do

  def mock_fix_file(stubs={})
    @mock_fix_file ||= mock_model(FixFile, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all fix_files as @fix_files" do
      FixFile.stub(:all) { [mock_fix_file] }
      get :index
      assigns(:fix_files).should eq([mock_fix_file])
    end
  end

  describe "GET show" do
    it "assigns the requested fix_file as @fix_file" do
      FixFile.stub(:find).with("37") { mock_fix_file }
      get :show, :id => "37"
      assigns(:fix_file).should be(mock_fix_file)
    end
  end

  describe "GET new" do
    it "assigns a new fix_file as @fix_file" do
      FixFile.stub(:new) { mock_fix_file }
      get :new
      assigns(:fix_file).should be(mock_fix_file)
    end
  end

  describe "GET edit" do
    it "assigns the requested fix_file as @fix_file" do
      FixFile.stub(:find).with("37") { mock_fix_file }
      get :edit, :id => "37"
      assigns(:fix_file).should be(mock_fix_file)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fix_file as @fix_file" do
        FixFile.stub(:new).with({'these' => 'params'}) { mock_fix_file(:save => true) }
        post :create, :fix_file => {'these' => 'params'}
        assigns(:fix_file).should be(mock_fix_file)
      end

      it "redirects to the created fix_file" do
        FixFile.stub(:new) { mock_fix_file(:save => true) }
        post :create, :fix_file => {}
        response.should redirect_to(fix_file_url(mock_fix_file))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fix_file as @fix_file" do
        FixFile.stub(:new).with({'these' => 'params'}) { mock_fix_file(:save => false) }
        post :create, :fix_file => {'these' => 'params'}
        assigns(:fix_file).should be(mock_fix_file)
      end

      it "re-renders the 'new' template" do
        FixFile.stub(:new) { mock_fix_file(:save => false) }
        post :create, :fix_file => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fix_file" do
        FixFile.should_receive(:find).with("37") { mock_fix_file }
        mock_fix_file.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fix_file => {'these' => 'params'}
      end

      it "assigns the requested fix_file as @fix_file" do
        FixFile.stub(:find) { mock_fix_file(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:fix_file).should be(mock_fix_file)
      end

      it "redirects to the fix_file" do
        FixFile.stub(:find) { mock_fix_file(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(fix_file_url(mock_fix_file))
      end
    end

    describe "with invalid params" do
      it "assigns the fix_file as @fix_file" do
        FixFile.stub(:find) { mock_fix_file(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:fix_file).should be(mock_fix_file)
      end

      it "re-renders the 'edit' template" do
        FixFile.stub(:find) { mock_fix_file(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fix_file" do
      FixFile.should_receive(:find).with("37") { mock_fix_file }
      mock_fix_file.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fix_files list" do
      FixFile.stub(:find) { mock_fix_file }
      delete :destroy, :id => "1"
      response.should redirect_to(fix_files_url)
    end
  end

end
