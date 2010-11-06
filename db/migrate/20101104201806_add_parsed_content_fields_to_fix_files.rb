class AddParsedContentFieldsToFixFiles < ActiveRecord::Migration
  def self.up
    add_column :fix_files, :parsed_content_before, :text
    add_column :fix_files, :parsed_content_after, :text
  end

  def self.down
    remove_column :fix_files, :parsed_content_after
    remove_column :fix_files, :parsed_content_before
  end
end
