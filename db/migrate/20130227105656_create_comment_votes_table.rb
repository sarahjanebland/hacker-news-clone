class CreateCommentVotesTable < ActiveRecord::Migration
  def change
    create_table :commentvotes do |t|
      t.integer   :user_id
      t.integer   :comment_id
      t.boolean   :action
      t.timestamps
    end
  end
end
