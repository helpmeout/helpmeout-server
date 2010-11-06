class FixFile < ActiveRecord::Base
  belongs_to :fix
  before_save :parse_file_contents

  def parse_file_contents
    self.parsed_content_before = FixFile.parse_content(content_before)
    self.parsed_content_after = FixFile.parse_content(content_after)
  end

  def self.parse_content(content)
    parser = RubyParser.new
    sexps = parser.process(content)

    processor = Processor.new
    processor.process sexps
  end

end
