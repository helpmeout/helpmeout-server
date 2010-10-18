class CreateFixFiles < ActiveRecord::Migration
  def self.up
    create_table :fix_files do |t|
      t.references :fix
      t.text :content_before
      t.text :content_after
      t.string :path

      t.timestamps
    end
  end

  def self.down
    drop_table :fix_files
  end
end
