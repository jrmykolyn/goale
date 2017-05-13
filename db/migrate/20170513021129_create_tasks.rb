class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :is_complete
      t.date :completed_on

      t.timestamps null: false
    end
  end
end
