class CreateProjectsTable < ActiveRecord::Migration
    def change 
        create_table :projects do |p|
            t.string :name
            t.integer :user_id

            t.timestamps null: false
        end
    end
end