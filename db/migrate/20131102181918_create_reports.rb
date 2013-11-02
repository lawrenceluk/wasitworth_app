class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	t.integer :wclass_id
    	t.text :comment
    	t.integer :wasitworth
    	t.integer :votes_for
    	t.integer :votes_against

      t.timestamps
    end
    add_index :reports, [:wclass_id, :created_at]
  end
end
