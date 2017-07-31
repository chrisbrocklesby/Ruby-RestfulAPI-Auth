###### Required Gems #######
require 'sinatra'
require 'data_mapper'
require 'json'
require 'bcrypt'
require 'daemons'

###### Required Helpers #######
require_relative 'helpers/auth_helper'
require_relative 'helpers/user_helper'
require_relative 'helpers/encrypt_helper'

###### Required Models #######
require_relative 'models/user_model'
require_relative 'models/post_model'

###### Required Controllers #######
require_relative 'controllers/app_controller'
require_relative 'controllers/upload_controller'
require_relative 'controllers/user_controller'
require_relative 'controllers/post_controller'

###### Database Configuration #######
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/databases/database.db")
DataMapper.finalize.auto_upgrade!

###### Configuration #######
set :environment, :development
set :port, 3000
set :apiname, 'Test API'