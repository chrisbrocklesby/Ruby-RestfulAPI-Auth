##################### Welcome - GET ################### 
get '/' do
  	content_type :json
  	{:status => "live", :apiname => settings.apiname}.to_json
end