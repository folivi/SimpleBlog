class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :label
      t.string :description

      t.timestamps
    end
    
    add_index :tags, :id, unique: true
    add_index :tags, :name, unique: true
  end
end
