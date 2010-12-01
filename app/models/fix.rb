class Fix < ActiveRecord::Base
  CODE_LINE_WEIGHT = 1
  EXCEPTION_MESSAGE_WEIGHT = 3
  has_many :fix_files
  before_save :strip_backtrace

  accepts_nested_attributes_for :fix_files, :reject_if => :all_blank

  def score(code_line, query_exception_message)
    message_score = EXCEPTION_MESSAGE_WEIGHT * Amatch::Levenshtein.new(exception_message).similar(query_exception_message)
    distance_score = CODE_LINE_WEIGHT * distance(code_line)
    message_score + distance_score
  end

  def distance(code_line)
    fix_files.collect do |fix_file|
      fix_file.distance(code_line)
    end.max
  end

  def strip_backtrace
    backtrace = backtrace.strip unless backtrace.blank?
  end
end
