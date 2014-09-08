class CreateArticlesAndUsers < ActiveRecord::Migration
  def change
    create_table :articles_users, id: false do |t|
      t.references :articles
      t.references :users
    end
  end
end
