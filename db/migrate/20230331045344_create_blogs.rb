class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.integer :blog_id

      t.timestamps
    end
  end
end

