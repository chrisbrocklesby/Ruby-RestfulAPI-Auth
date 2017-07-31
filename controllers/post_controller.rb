##################### Post - GET All ################### 
get '/posts/?' do
	protected!
  content_type :json
  @posts = Post.all(:order => :created_at.desc)
  @posts.to_json
end


##################### Post - POST ################### 
post '/post/?' do
	protected!
	content_type :json
	jsonbody = JSON.parse(request.body.read)
	@post = Post.new(jsonbody)
  @post.user_id = userID

	if @post.save
		@post.to_json
	else
		halt 500
	end
end


##################### Post - GET by ID ################### 
get '/post/:id/?' do
	protected!
  content_type :json
  @post = Post.get(params[:id].to_i)

  userOwnerCheck(@post.user_id)

  if @post
    @post.to_json
  else
    halt 404
  end
end


##################### Post - UPDATE by ID ################### 
put '/post/:id/?' do
	protected!
  content_type :json
  jsonbody = JSON.parse(request.body.read)
  @post = Post.get(params[:id].to_i)
  @post.update(jsonbody)
  @post.modified_at = Time.now

  userOwnerCheck(@post.user_id)

  if @post.save
    @post.to_json
  else
    halt 500
  end
end


##################### Post - DELETE by ID ################### 
delete '/post/:id/delete/?' do
	protected!
  content_type :json
  @post = Post.get(params[:id].to_i)

  userOwnerCheck(@post.user_id)

  if @post.destroy
    {:success => "ok"}.to_json
  else
    halt 500
  end
end