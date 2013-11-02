class RenameTypeAddTimestampsToClass < ActiveRecord::Migration
  def change
  	rename_column :w_classes, :type, :class_type
  end
end