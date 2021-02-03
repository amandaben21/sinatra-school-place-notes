class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :subject_name
      t.string :date
      t.string :note_entry
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
