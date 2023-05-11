local runtimes = {
	["serverscriptservice"] = "server";
	["serverstorage"] = "server";
	["startergui"] = "client";
	["starterpack"] = "client";
	["starterplayer"] = "client";
	["teams"] = "client";
	["soundservice"] = "server";
	["chat"] = "client";
	["textchatservice"] = "client";
	["localizationservice"] = "client";
}
local types = {
	["false"] = "server";
	["true"] = "client";
}
local RunService = game:GetService("RunService")
return {
	GetRunTime = function(FromSource , ReqInfo)
		local currentRuntime = RunService:IsClient()
		if (not FromSource) then
			local Service = ReqInfo[2][2]
			local Runtime = runtimes[string.lower(Service)]
			if (Runtime == "server" and currentRuntime == false) then
				return "server"
			elseif (Runtime == "client" and currentRuntime == true) then
				return "client"
			elseif (Runtime == "server" and currentRuntime == true) then
				return nil
			elseif (Runtime == "client" and currentRuntime == false) then
				return nil
			end
		elseif (FromSource) then
			return types[string.lower(tostring(currentRuntime))]
		end;
	end;
}
