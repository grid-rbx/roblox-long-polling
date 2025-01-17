local HttpService = game:GetService("HttpService")
local connection = require(script:WaitForChild("Connection"));

return function(url, password)
	local connectionRequest = HttpService:RequestAsync({
		Url = url.."/connection",
		Method = "POST",
		Headers = {
			["Content-Type"] = "Application/JSON",
		},
		Body = HttpService:JSONEncode({
			password = password
		})
	})
	local response = HttpService:JSONDecode(connectionRequest.Body);

	if response.success == true then
		return connection.__new(url, response.socketId);
	else
		print(connectionRequest.Body)
		error("Connection failed")
	end
end