local mult = 10;

for key,value in pairs(data.raw["mining-drill"]) do
	if value.mining_speed ~= nil then
		data.raw["mining-drill"][key].mining_speed = value.mining_speed / mult;
	end
	if value.energy_source ~= nil then
		if value.energy_source.emissions_per_minute ~= nil then
			data.raw["mining-drill"][key].energy_source.emissions_per_minute = value.energy_source.emissions_per_minute / mult;
		end
	end
	if value.energy_usage ~= nil then
		local unit = value.energy_usage:sub(-2);
		local units_num = tostring(tonumber(value.energy_usage:sub(0, value.energy_usage:len() - 2)) / mult);
		data.raw["mining-drill"][key].energy_usage = units_num .. unit;
	end
end
