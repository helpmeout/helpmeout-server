class AddLexedFieldsToFixFiles < ActiveRecord::Migration
  def self.up
    add_column :fix_files, :lexed_content_before, :text
  end

  def self.down
    remove_column :fix_files, :lexed_content_before
  end
end
