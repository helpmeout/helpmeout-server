require 'spec_helper'

describe FixFile do
  describe 'before_save' do
    it 'should run parse_file_contents' do
      fix_file = FixFile.new
      fix_file.should_receive(:parse_file_contents)
      fix_file.save
    end
  end

  describe 'parse_file_contents' do
    it 'should assign the parsed content to the before and after fields' do
      fix_file = FixFile.new(:content_before => 'Content before',
                             :content_after => 'Content after')
      FixFile.should_receive(:parse_content).with('Content before').and_return('Parsed before')
      FixFile.should_receive(:parse_content).with('Content after').and_return('Parsed after')
      fix_file.parse_file_contents
      fix_file.parsed_content_before.should == 'Parsed before'
      fix_file.parsed_content_after.should == 'Parsed after'
    end
  end

  describe 'parse_content' do
    it 'should parse into sexps and return the processors result' do
      sexps = stub('S-Expressions')
      parser = stub('Parser')
      RubyParser.should_receive(:new).and_return(parser)
      parser.should_receive(:process).with('Unparsed Content').and_return(sexps)
      processor = stub('Processor')
      Processor.should_receive(:new).and_return(processor)
      processor.should_receive(:process).with(sexps).and_return('Parsed Content')
      FixFile.parse_content('Unparsed Content').should == 'Parsed Content'
    end
  end
end
