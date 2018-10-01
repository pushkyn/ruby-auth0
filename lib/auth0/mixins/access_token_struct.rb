AccessToken = Struct.new(
  :access_token,
  :expires_in,
  :refresh_token,
  :id_token
) do

  def token
    access_token
  end
end