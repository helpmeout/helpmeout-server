require 'spec_helper'

describe "fixes/edit.html.erb" do
  before(:each) do
    @fix = assign(:fix, stub_model(Fix,
      :new_record? => false,
      :exception_message => "MyString",
      :backtrace => "MyText"
    ))
  end

  it "renders the edit fix form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fix_path(@fix), :method => "post" do
      assert_select "input#fix_exception_message", :name => "fix[exception_message]"
      assert_select "textarea#fix_backtrace", :name => "fix[backtrace]"
    end
  end
end
