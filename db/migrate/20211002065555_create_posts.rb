class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text       :caption, null: false
      t.integer    :category_id, null: false
      t.references :user, null: false, foreign: true
      t.timestamps
    end
  end
end
