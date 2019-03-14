class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|

      t.string :name
      t.integer :start_time
      t.integer :end_time

      t.integer :number_completed
      t.integer :number_prompted

      t.timestamps
    end
  end
end
