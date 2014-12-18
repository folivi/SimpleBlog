class ChangeColumnInArticles < ActiveRecord::Migration
  def change
    change_column :articles, :content, :text
  end
end
