require 'spec_helper'

describe "fixes/show.html.erb" do
  before(:each) do
    @fix = assign(:fix, stub_model(Fix,
      :exception_message => "Exception Message",
      :backtrace => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Exception Message/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
