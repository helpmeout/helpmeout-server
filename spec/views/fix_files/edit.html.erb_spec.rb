require 'spec_helper'

describe "fix_files/edit.html.erb" do
  before(:each) do
    @fix_file = assign(:fix_file, stub_model(FixFile,
      :new_record? => false,
      :fix => "",
      :content_before => "MyText",
      :content_after => "MyText",
      :path => "MyString"
    ))
  end

  it "renders the edit fix_file form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fix_file_path(@fix_file), :method => "post" do
      assert_select "input#fix_file_fix", :name => "fix_file[fix]"
      assert_select "textarea#fix_file_content_before", :name => "fix_file[content_before]"
      assert_select "textarea#fix_file_content_after", :name => "fix_file[content_after]"
      assert_select "input#fix_file_path", :name => "fix_file[path]"
    end
  end
end
