class Fix < ActiveRecord::Base
  has_many :fix_files

  accepts_nested_attributes_for :fix_files, :reject_if => :all_blank


  def distance(code_line)
    fix_files.collect do |fix_file|
      fix_file.distance(code_line)
    end.min
  end
end
