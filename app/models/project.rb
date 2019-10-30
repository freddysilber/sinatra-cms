class Project < ActiveRecord::Base
	belongs_to :user
	def project_tasks
		tasks = []
		Task.all.each do |t|
			if t.project_id == self.id
				tasks << t
			end
		end
		tasks
	end

	def self.my_projects(current_user_id)
		projects = []
		self.all.each do |p|
			if p.user_id == current_user_id
				projects << p
			end
		end
		projects
	end
end