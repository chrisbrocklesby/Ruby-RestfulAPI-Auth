helpers do

  ### Get Current User ID ###
  def userID
    if params[:token]
    	@user = User.first(:token => params[:token])
  	else
  		@user = User.first(:token => request.env['HTTP_AUTHORIZATION'])
  	end
    return @user.id.to_s
  end

	def userOwnerCheck(id)
	  if id != userID
	      halt 401
	  end
	end

end