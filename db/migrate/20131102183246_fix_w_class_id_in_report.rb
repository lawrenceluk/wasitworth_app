class FixWClassIdInReport < ActiveRecord::Migration
  def change
  	rename_column :reports, :wclass_id, :w_class_id
  end
end
