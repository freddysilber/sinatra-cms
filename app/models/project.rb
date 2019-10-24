require 'pry'
class Project < ActiveRecord::Base
    belongs_to :user
end