class User
  	include DataMapper::Resource
    property :id, Serial, :key => true
  	property :created_at, DateTime
  	property :modified_at, DateTime
  	property :email, String, :unique => true, :length => 7..255, :format => :email_address, :required => true
  	property :password, String, :length => 7..255, :required => true
  	property :token, String, :unique => true, :length => 7..255
end