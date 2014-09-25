class RemoveAuthorIdColumnFromCollaborations < ActiveRecord::Migration
  def change
    remove_column :collaborations, :author_id, :integer
  end
end
