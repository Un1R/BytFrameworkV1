return {
	x1 = function(Name , Funcs, Desc)
		local Table = {
			Service_Info = {
				["Name"] = "";
				["Description"] = "";
				Functions = {};
			};
		};
		for v in Funcs do
			table.insert(Table.Service_Info.Functions,Funcs[v]);
		end;
		Table.Service_Info.Name = Name;
		Table.Service_Info.Description = Desc;
		return Table
	end;
}
