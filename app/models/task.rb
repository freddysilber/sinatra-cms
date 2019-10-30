class Task < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	def self.my_tasks(current_user_id)
		tasks = []
		self.all.each do |t|
			if t.user_id == current_user_id
				tasks << t
			end
		end
		tasks
	end
end