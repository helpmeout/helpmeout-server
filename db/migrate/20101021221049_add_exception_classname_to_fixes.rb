class AddExceptionClassnameToFixes < ActiveRecord::Migration
  def self.up
    add_column :fixes, :exception_classname, :string
  end

  def self.down
    remove_column :fixes, :exception_classname
  end
end
