class ChangeFixesExceptionMessageType < ActiveRecord::Migration
  def self.up
    change_column :fixes, :exception_message, :text
  end

  def self.down
    change_column :fixes, :exception_message, :string
  end
end
