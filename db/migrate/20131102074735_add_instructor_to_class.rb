class AddInstructorToClass < ActiveRecord::Migration
  def change
  	add_column :w_classes, :instructor, :string
  end
end
