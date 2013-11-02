class AddSlugToClass < ActiveRecord::Migration
  def change
  	add_column :w_classes, :slug, :string
  end
end
