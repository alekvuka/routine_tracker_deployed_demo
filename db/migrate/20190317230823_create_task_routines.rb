class CreateTaskRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :task_routines do |t|

      t.integer :task_id
      t.integer :routine_id

      t.timestamps
    end
  end
end
