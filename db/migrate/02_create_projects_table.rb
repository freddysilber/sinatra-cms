class CreateProjectsTable < ActiveRecord::Migration[4.2]
	def change 
		create_table :projects do |p|
			p.string :name
			p.integer :user_id
			p.timestamps null: false
		end
	end
end