class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.text :author
      t.text :media

      t.timestamps
    end
  end
end
