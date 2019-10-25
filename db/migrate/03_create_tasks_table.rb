class CreateTasksTable < ActiveRecord::Migration[4.2]
	def change
		create_table :tasks do |t|
			t.boolean :complete
			t.integer :project_id
			t.integer :user_id
			t.string :name
			t.string :due_date
			t.timestamps null: false
		end
	end
end