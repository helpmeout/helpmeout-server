require 'spec_helper'

describe Fix do
  describe 'distance' do
    it 'should return the minimum distance of its fix files' do
      fix = Fix.new
      
      fix_file_1 = stub('Fix file 1')
      fix_file_1.should_receive(:distance).with('code line').and_return(4)

      fix_file_2 = stub('Fix file 2')
      fix_file_2.should_receive(:distance).with('code line').and_return(1)

      fix_file_3 = stub('Fix file 3')
      fix_file_3.should_receive(:distance).with('code line').and_return(3)

      fix.stub(:fix_files => [fix_file_1, fix_file_2, fix_file_3])
      fix.distance('code line').should == 1
    end
  end
end
