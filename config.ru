require './config/environment'
#  controlller mounting
use Rack::MethodOverride
use UsersController
use ProjectsController
use TasksController
run ApplicationController