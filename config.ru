require './config/environment'

use Rack::MethodOverride
use UsersController
use ProjectsController
use TasksController
run ApplicationController