require './config/environment'

use Rack::MethodOverride
use UsersController
use ProjectsController
run ApplicationController