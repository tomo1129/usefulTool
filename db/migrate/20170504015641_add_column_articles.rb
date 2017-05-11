class AddColumnArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :description, :string
    add_column :articles, :keywords, :string
    add_column :articles, :public, :boolean, default: false, null: false
  end
end
