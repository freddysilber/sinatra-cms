require 'pry'
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
end