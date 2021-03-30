require_relative './config/environment'
 

use Rack::MethodOverride #perform action patch or delete
use CompanyController
use OrderController
use UserController
run ApplicationController