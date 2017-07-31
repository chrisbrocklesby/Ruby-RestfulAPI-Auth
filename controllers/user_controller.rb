##################### User - GET All ################### 
get '/users/?' do
  protected!
  content_type :json
  @users = User.all(:order => :created_at.desc)
  @users.to_json
end


##################### User - Register ################### 
post '/user/register/?' do
  content_type :json
  jsonbody = JSON.parse(request.body.read)
  jsonbody['password'] = encrypt(jsonbody['password'])
  @user = User.new(jsonbody)
 	
  if @user.save
	 {:success => "ok"}.to_json
  else
    halt 500
  end
end


##################### User - Login ################### 
post '/user/login/?' do
  content_type :json
  jsonbody = JSON.parse(request.body.read)
  email = jsonbody['email']
  password = jsonbody['password']
  token = SecureRandom.urlsafe_base64(40).to_s

  @user = User.first(:email => email)
  
  if @user != nil && @user.email == email && encryptcheck(@user.password, password) == true
      @user.token = token
      @user.modified_at = Time.now
      @user.save
      {:success => "ok", :token => token}.to_json
  else
    halt 401
  end
end


##################### User - Logout ################### 
put '/user/logout/?' do
  content_type :json
  jsonbody = JSON.parse(request.body.read)
  email = jsonbody['email']

  @user = User.first(:email => email)

  if @user != nil && @user.email == email
  	@user.modified_at = Time.now
  	@user.token = nil
  	@user.save
    {:success => "ok"}.to_json
  else
    halt 500
  end
end