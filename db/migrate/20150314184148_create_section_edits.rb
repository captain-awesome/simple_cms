class CreateSectionEdits < ActiveRecord::Migration

	# adding t.refeences (for foreign keys) is the same thing like adding t.integer with the id after it.
  #example: t.integer "admin_id".

  #This model requires a primary key. Do not use - create_table :section_edits, :id => false do |t|

  def up
    create_table :section_edits do |t|
      t.references :admin_user
      t.references :section
      t.string :summary
      t.timestamps
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end

  def down
    drop_table :section_edits
  end

end
