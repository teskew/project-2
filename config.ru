require_relative './config/environment'
 

use Rack::MethodOverride
use CompanyController
use OrderController
use UserController
run ApplicationController