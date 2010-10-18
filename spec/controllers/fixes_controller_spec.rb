require 'spec_helper'

describe FixesController do

  def mock_fix(stubs={})
    @mock_fix ||= mock_model(Fix, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all fixes as @fixes" do
      Fix.stub(:all) { [mock_fix] }
      get :index
      assigns(:fixes).should eq([mock_fix])
    end
  end

  describe "GET show" do
    it "assigns the requested fix as @fix" do
      Fix.stub(:find).with("37") { mock_fix }
      get :show, :id => "37"
      assigns(:fix).should be(mock_fix)
    end
  end

  describe "GET new" do
    it "assigns a new fix as @fix" do
      Fix.stub(:new) { mock_fix }
      get :new
      assigns(:fix).should be(mock_fix)
    end
  end

  describe "GET edit" do
    it "assigns the requested fix as @fix" do
      Fix.stub(:find).with("37") { mock_fix }
      get :edit, :id => "37"
      assigns(:fix).should be(mock_fix)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fix as @fix" do
        Fix.stub(:new).with({'these' => 'params'}) { mock_fix(:save => true) }
        post :create, :fix => {'these' => 'params'}
        assigns(:fix).should be(mock_fix)
      end

      it "redirects to the created fix" do
        Fix.stub(:new) { mock_fix(:save => true) }
        post :create, :fix => {}
        response.should redirect_to(fix_url(mock_fix))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fix as @fix" do
        Fix.stub(:new).with({'these' => 'params'}) { mock_fix(:save => false) }
        post :create, :fix => {'these' => 'params'}
        assigns(:fix).should be(mock_fix)
      end

      it "re-renders the 'new' template" do
        Fix.stub(:new) { mock_fix(:save => false) }
        post :create, :fix => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fix" do
        Fix.should_receive(:find).with("37") { mock_fix }
        mock_fix.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fix => {'these' => 'params'}
      end

      it "assigns the requested fix as @fix" do
        Fix.stub(:find) { mock_fix(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:fix).should be(mock_fix)
      end

      it "redirects to the fix" do
        Fix.stub(:find) { mock_fix(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(fix_url(mock_fix))
      end
    end

    describe "with invalid params" do
      it "assigns the fix as @fix" do
        Fix.stub(:find) { mock_fix(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:fix).should be(mock_fix)
      end

      it "re-renders the 'edit' template" do
        Fix.stub(:find) { mock_fix(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fix" do
      Fix.should_receive(:find).with("37") { mock_fix }
      mock_fix.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fixes list" do
      Fix.stub(:find) { mock_fix }
      delete :destroy, :id => "1"
      response.should redirect_to(fixes_url)
    end
  end

end
