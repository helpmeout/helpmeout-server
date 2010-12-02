class FixFile < ActiveRecord::Base
  belongs_to :fix
  before_save :set_lexed_content_before

  # def parse_file_contents
  #   self.parsed_content_before = FixFile.parse_content(content_before)
  #   self.parsed_content_after = FixFile.parse_content(content_after)
  # end

  # def self.parse_content(content)
  #   parser = RubyParser.new
  #   sexps = parser.process(content)

  #   processor = Processor.new
  #   processor.process sexps
  # end

  def set_lexed_content_before
    self.content_before ||= ''
    self.lexed_content_before = begin
                                  Lexer.lex(content_before)
                                rescue
                                  content_before
                                end
  end

  def distance(code_line)
    lexed_line = Lexer.lex(code_line)
    pattern = Amatch::Levenshtein.new(lexed_line.strip)
    lexed_content_before.split("\n").collect do |line|
      pattern.similar(line.strip)
    end.max
  end

end
