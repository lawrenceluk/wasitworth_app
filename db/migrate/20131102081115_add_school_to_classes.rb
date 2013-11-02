class AddSchoolToClasses < ActiveRecord::Migration
  def change
   	add_column :w_classes, :school_id, :integer
   	add_index :w_classes, [:school_id, :created_at]
  end
end
