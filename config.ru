require './config/environment'

use Rack::MethodOverride
use UsersController
run ApplicationController