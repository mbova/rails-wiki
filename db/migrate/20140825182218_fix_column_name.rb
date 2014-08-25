class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :articles, :name, :title
  end
end
