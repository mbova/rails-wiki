class CreateSharing < ActiveRecord::Migration
  def change
    create_table :sharings do |t|
      t.integer :user_id
      t.integer :article_id
      t.timestamps
    end
  end
  add_index :users, :id, unique: true
end
