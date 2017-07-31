###### Required Gems #######
require 'sinatra'
require 'data_mapper'
require 'json'
require 'bcrypt'

###### Required Helpers #######
require_relative 'helpers/auth_helper'
require_relative 'helpers/encrypt_helper'

###### Required Models #######
require_relative 'models/user_model'
require_relative 'models/post_model'

###### Required Controllers #######
require_relative 'controllers/user_controller'
require_relative 'controllers/post_controller'

###### Configuration #######
set :environment, :development 
set :apiname, 'Test API'