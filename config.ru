require_relative './config/env'

use Rack::MethodOverride
use CollectionsController
use UserController
run ApplicationController