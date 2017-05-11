class CreateSmallCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :small_categories do |t|
      t.references :middle_category, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
