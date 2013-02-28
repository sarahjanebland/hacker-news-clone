class CreatePostVotesTable < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.integer   :user_id
      t.integer   :post_id
      t.boolean   :action
      t.timestamps
    end
  end
end
