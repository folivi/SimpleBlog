class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.boolean :approved, default: :false
      
      t.references :article
      t.references :user

      t.timestamps
    end
  end
end
