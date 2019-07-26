class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :content
      t.integer :author_id
      t.integer :noteable_id
      t.string :noteable_type
      t.timestamps
    end
    
    add_index :notes, [:noteable_id, :noteable_type]
  end
end
