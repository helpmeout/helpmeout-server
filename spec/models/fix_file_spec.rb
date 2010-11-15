require 'spec_helper'

describe FixFile do
  describe 'before_save' do
    it 'should run set_lexed_content_before' do
      fix_file = FixFile.new
      # fix_file.should_receive(:parse_file_contents)
      fix_file.should_receive(:set_lexed_content_before)
      fix_file.save
    end
  end

  # describe 'parse_file_contents' do
  #   it 'should assign the parsed content to the before and after fields' do
  #     fix_file = FixFile.new(:content_before => 'Content before',
  #                            :content_after => 'Content after')
  #     FixFile.should_receive(:parse_content).with('Content before').and_return('Parsed before')
  #     FixFile.should_receive(:parse_content).with('Content after').and_return('Parsed after')
  #     fix_file.parse_file_contents
  #     fix_file.parsed_content_before.should == 'Parsed before'
  #     fix_file.parsed_content_after.should == 'Parsed after'
  #   end
  # end

  # describe 'parse_content' do
  #   it 'should parse into sexps and return the processors result' do
  #     sexps = stub('S-Expressions')
  #     parser = stub('Parser')
  #     RubyParser.should_receive(:new).and_return(parser)
  #     parser.should_receive(:process).with('Unparsed Content').and_return(sexps)
  #     processor = stub('Processor')
  #     Processor.should_receive(:new).and_return(processor)
  #     processor.should_receive(:process).with(sexps).and_return('Parsed Content')
  #     FixFile.parse_content('Unparsed Content').should == 'Parsed Content'
  #   end
  # end

  describe 'set_lexed_content_before' do
    it 'should set the lexed_content_before with the lexer' do
      Lexer.should_receive(:lex).with('content before').and_return('lexed')
      fix_file = FixFile.new(:content_before => 'content before')
      fix_file.send(:set_lexed_content_before)
      fix_file.lexed_content_before.should == 'lexed'
    end
  end

  describe 'distance' do
    it 'should return the lowest distance score of the stripped lexed code lines' do
      Lexer.should_receive(:lex).with('  a=1').and_return('  VAR=1')
      pattern = stub('Pattern')
      Amatch::Levenshtein.should_receive(:new).with('VAR=1').and_return(pattern)

      lexed_content = "class CONSTANT\n  VAR=2\nend"
      pattern.should_receive(:match).with('class CONSTANT').and_return(7)
      pattern.should_receive(:match).with('VAR=2').and_return(1)
      pattern.should_receive(:match).with('end').and_return(5)

      fix_file = FixFile.new(:lexed_content_before => lexed_content)
      fix_file.distance('  a=1').should == 1
    end

  end
end
