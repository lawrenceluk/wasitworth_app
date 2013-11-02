class CreateWClasses < ActiveRecord::Migration
  def change
    create_table :w_classes do |t|
      t.string :name
      t.time :time
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
