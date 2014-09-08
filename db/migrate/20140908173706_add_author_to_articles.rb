class AddAuthorToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author, :integer
    add_column :articles, :public, :boolean
  end
end
