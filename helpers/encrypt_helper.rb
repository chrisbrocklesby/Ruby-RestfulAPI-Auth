helpers do
### Encrypt Data - Oneway ###
  def encrypt(string)
    BCrypt::Password.create(string)
  end

  ### Encrypt Data - Check if match ###
  def encryptcheck(string, check)
    return BCrypt::Password.new(string) == check
  end
end