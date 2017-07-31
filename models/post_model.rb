###### Post Model #######
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/databases/post_database.db")

class Post
  	include DataMapper::Resource
	property :id, Serial, :key => true
  	property :created_at, DateTime
  	property :title, String, :length => 255
  	property :description, Text
end

DataMapper.finalize.auto_upgrade!