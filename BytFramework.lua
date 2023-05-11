--[[

BytFramework

!! MADE BY Un1versality !!

// FEATURES

BYTF.Init(Extra);
BYTF.MakeService({Name = ""; Functions = {}; Description = "";});
BYTF.GetService("SERVICE");
BYTF.DebugFunction(Function,Args,PrintName) -- Args can be nil, but if not, it must be a table.

]]

local t1 = tick();
local ready = script:WaitForChild("READY",20);
local x = {};
local BYTF = {};
local Services = {};
local Initiated = {Server={};Client={};};
x.Version = "V1.0.0"
x.Publish = "008";
local Services = require(script:FindFirstChild("Services"));
local Runtime = require(script:FindFirstChild("Runtime"));
local String = require(script:FindFirstChild("String"));
local HttpService = game:GetService("HttpService");
BYTF.CheckIfByt = function()
	local RawData = rawget(debug,"traceback")();
	local y = Runtime.GetRunTime(true,{RawData , string.split(RawData,".")});
	if (y ~= nil) then
		if (y == "server") then
			if (Initiated.Server[RawData]) then
				return true;
			else
				return false;
			end;
		elseif (y == "client") then
			if (Initiated.Client[RawData]) then
				return true;
			else
				return false;
			end;
		end;
	end;
	return false
end;
BYTF.Init = function(self,Extra)
	local RawData = rawget(debug,"traceback")();
	local y = Runtime.GetRunTime(true,{RawData , string.split(RawData,".")});
	if (y ~= nil) then
		if (y == "server") then
			table.insert(Initiated.Server,RawData);
		elseif (y == "client") then
			table.insert(Initiated.Client,RawData);
		end;
	end;
end;
BYTF.MakeService = function(self,Info)
	local Name, Functions, Description = Info[1] or warn("NO SERVICE NAME FOUND"), Info[2] or warn("NO SERVICE FUNCTIONS FOUND"), Info[3] or nil;
	local n = Services.x1(Name, Functions, Description);
	table.insert(Services,n)
end;
BYTF.SendWebhookMessage = function(self,URL,Message)
	local sub = string.gsub(URL,"https://discord.com/","https://hooks.hyra.io/")
	local data = {
		['WebhookURL'] = sub;
		['WebhookData'] = {['username']='BytFramework_Message', ['content']=Message};
	};
	local data__ = HttpService:JSONEncode(data);
	local a,b = pcall(function()
		HttpService:PostAsync(sub, data, Enum.HttpContentType.ApplicationJson)
	end)
	if (a == false) then
		return warn("There was an error submitting a message to your webhook.")
	elseif (a == true) then
		return print("Webhook sent successfuly!")
	end;
end;
BYTF.CheckRuntime = function(FromSource)
	local RawData = rawget(debug,"traceback")();
	if (typeof(FromSource) ~= "boolean") then
		warn("FromSource value is set to NIL or not a boolean. Automatically setting to false.");
		return Runtime.GetRunTime(false , {RawData , string.split(RawData,".")});
	end;
	return Runtime.GetRunTime(FromSource , {RawData , string.split(RawData,".")});
end;
BYTF.GetService = function(self,Name)
	if not BYTF.CheckIfByt() then return end
	for i,v in ipairs(Services) do
		if v.Table.Service_Info then
			local Tabl = v.Table.Service_Info;
			if (Tabl.Name == Name) then
				return Tabl.Functions;
			end;
		elseif v.Service_Info then
			local Tabl = v.Service_Info;
			if (Tabl.Name == Name) then
				return Tabl.Functions;
			end;
		end;
	end;
end;
BYTF.DebugFunction = function(self,Function,Args,PrintName)
	local t1__ = tick();
	if (Args == nil) then
		warn("Args argument is empty. Automatically calling with no arguments sent.");
		local a,b=pcall(function()
			Function();
		end)
		if a == false then
			return print("Function",PrintName,"ran with the error:",b);
		elseif a == true then
			return print("Function",PrintName,"took:",tick()-t1__.."s","to run with no errors!");
		end
	elseif (Args ~= nil) then
		if (typeof(Args) ~= "table") then
			warn("Args argument isn't a table. Automatically calling with no arguments sent.");
			local a,b=pcall(function()
				Function();
			end)
			if a == false then
				return print("Function",PrintName,"ran with the error:",b);
			elseif a == true then
				return print("Function",PrintName,"took:",tick()-t1__.."s","to run with no errors!");
			end
		elseif (typeof(Args) == "table") then
			local a,b=pcall(function()
				Function(table.unpack(Args));
			end)
			if a == false then
				return print("Function",PrintName,"ran with the error:",b);
			elseif a == true then
				return print("Function",PrintName,"took:",tick()-t1__.."s","to run with no errors!");
			end
		end;
	end;
end;
if (ready.Value == false) then
	ready.Value = true
	print([[
	
	_____________________________
	
	//! BytFramework !\\
	MADE BY Un1versality
	
	Report any errors you see in this console. They're highlighted with the red color.
	
	// INITIATED FRAMEWORK, TOOK:
	
	]] .. [[
	
	]] .. tick() - t1 .. "s" .. [[
	
	VERSION:
	]] .. x.Version .. [[
	
	PUBLISH:
	]] .. x.Publish .. [[
	
	_____________________________
	]]);	
end;
return BYTF;
