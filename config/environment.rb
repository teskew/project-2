

require 'bundler/setup'
Bundler.require

require_all 'app'


ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/development.sqlite"
)



# require_all 'app'


# ActiveRecord::Base.establish_connection(
#     adapter: "sqlite3",
#     database: "db/development.sqlite"
# )
# ENV['SINATRA_ENV'] ||= "development"

# require 'bundler/setup'
# Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

# require './app/controllers/application_controller'
# require_all 'app'

