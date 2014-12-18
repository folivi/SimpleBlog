class CreateArticlesTags < ActiveRecord::Migration
  def change
    create_table :articles_tags do |t|
      t.references :article, index: true
      t.references :tag, index: true
    end
  end
end
