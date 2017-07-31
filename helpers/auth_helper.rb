helpers do

  ### User Auth Check ###
  def protected!
    @user = User.first(:token => request.env['HTTP_AUTHORIZATION'])
    if !@user || @user.token == nil
      halt 401
    end
  end

end