######## Upload - POST ##########
post "/upload/?" do halt 500 unless !params['file'].nil?
	protected!
	content_type :json
	File.open('public/uploads/' + userID + "-" + rand.to_s[2..6] + "-" + params['file'][:filename], "w") do |f|
    f.write(params['file'][:tempfile].read)
  end
	{:success => "ok"}.to_json
end


######## Delete - DELETE ##########
delete "/upload/delete/?" do
	protected!
	content_type :json
	File.delete('public/uploads/' + params['file'])
	{:success => "ok"}.to_json
end