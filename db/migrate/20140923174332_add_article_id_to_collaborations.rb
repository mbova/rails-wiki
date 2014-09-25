class AddArticleIdToCollaborations < ActiveRecord::Migration
  def change
    add_column :collaborations, :article_id, :integer
  end
end
