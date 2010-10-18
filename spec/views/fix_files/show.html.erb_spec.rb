require 'spec_helper'

describe "fix_files/show.html.erb" do
  before(:each) do
    @fix_file = assign(:fix_file, stub_model(FixFile,
      :fix => "",
      :content_before => "MyText",
      :content_after => "MyText",
      :path => "Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Path/)
  end
end
