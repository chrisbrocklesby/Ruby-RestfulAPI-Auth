class Post
  	include DataMapper::Resource
		property :id, Serial, :key => true
		property :user_id, String
  	property :created_at, DateTime
  	property :modified_at, DateTime
  	property :title, String, :length => 255
  	property :content, Text
end