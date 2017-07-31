helpers do

  ### Get Current User ID ###
  def userID
    @user = User.first(:token => request.env['HTTP_AUTHORIZATION'])
    return @user.id.to_s
  end

	def userOwnerCheck(id)
	  if id != userID
	      halt 401
	  end
	end

end