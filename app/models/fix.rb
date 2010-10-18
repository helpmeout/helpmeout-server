class Fix < ActiveRecord::Base
  has_many :fix_files

  accepts_nested_attributes_for :fix_files, :reject_if => :all_blank
end
