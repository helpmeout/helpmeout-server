require 'spec_helper'

describe "fixes/new.html.erb" do
  before(:each) do
    assign(:fix, stub_model(Fix,
      :exception_message => "MyString",
      :backtrace => "MyText"
    ).as_new_record)
  end

  it "renders new fix form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fixes_path, :method => "post" do
      assert_select "input#fix_exception_message", :name => "fix[exception_message]"
      assert_select "textarea#fix_backtrace", :name => "fix[backtrace]"
    end
  end
end
