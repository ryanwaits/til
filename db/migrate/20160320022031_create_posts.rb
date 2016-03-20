class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :hashtag, index: true
      t.timestamp :date
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
