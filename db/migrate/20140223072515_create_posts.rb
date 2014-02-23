class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :contributor
      t.string :content
      t.string :post_number

      t.timestamps
    end
  end
end
