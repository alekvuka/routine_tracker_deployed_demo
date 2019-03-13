class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|

      t.string :name
      t.integer :user_id
      t.integer :routine_id

      t.integer :number_completed
      t.integer :number_prompted

      t.string :type 

      t.timestamps
    end
  end
end
