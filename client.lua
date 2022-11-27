Citizen.CreateThread(function()
	while true do
		local S = 1000
		local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)

		if GetPedInVehicleSeat(veh, GetPlayerPed(-1)) and GetIsVehicleEngineRunning(veh) and not IsPauseMenuActive() then
			for p,v in pairs(Config.Cars) do
				if v.c == GetDisplayNameFromVehicleModel(GetEntityModel(veh)) then
					m = GetVehicleMod(veh,11)
					if m == -1 then		v = v.vel
					elseif m == 0 then	v = v.m1
					elseif m == 1 then	v = v.m2
					elseif m == 2 then	v = v.m3
					elseif m == 3 then	v = v.m4
					end
					SetEntityMaxSpeed(veh,v/3.6)
				end
			end
		else
			S = 5000
		end
		Citizen.Wait(S)
	end
end)