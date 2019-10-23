class Project < ActiveRecord::Base
    belongs_to :user

    def self.find_by_id(id)
        Project.all.find{|p| p.id == id}
    end
end