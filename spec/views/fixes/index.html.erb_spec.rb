require 'spec_helper'

describe "fixes/index.html.erb" do
  before(:each) do
    assign(:fixes, [
      stub_model(Fix,
        :exception_message => "Exception Message",
        :backtrace => "MyText"
      ),
      stub_model(Fix,
        :exception_message => "Exception Message",
        :backtrace => "MyText"
      )
    ])
  end

  it "renders a list of fixes" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Exception Message".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
