class CreateTasksTable < ActiveRecord::Migration[4.2]
	def change
		create_table :tasks do |t|
			t.string :name
			t.integer :project_id
			t.integer :user_id

			t.timestamps null: false
		end
	end
end