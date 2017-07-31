helpers do

  ### User Auth Check ###
  def protected!
  	if params[:token]
    	@user = User.first(:token => params[:token])
  	else
  		@user = User.first(:token => request.env['HTTP_AUTHORIZATION'])
  	end
  	
    if !@user || @user.token == nil
      halt 401
    end
  end

end