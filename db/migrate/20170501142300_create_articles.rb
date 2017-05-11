class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :small_category, foreign_key: true
      t.string :title
      t.text :sentence

      t.timestamps
    end
  end
end
