require_relative './config/environment'

use Rack::MethodOverride
use UserController
use WorkoutController
use RoutineController
run ApplicationController