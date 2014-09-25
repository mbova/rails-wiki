class CreateCollaborations < ActiveRecord::Migration
  def change
    drop_table :collaborations
    create_table :collaborations do |t|
      t.timestamps
      t.integer :author_id
      t.integer :user_id
      t.boolean :access
    end
  end
end
