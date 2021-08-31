ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local restricted = false
local carotime = 0
local carotime1 = Config.RepairCaroTime1
local carotime2 = Config.RepairCaroTime2
local carotime3 = Config.RepairCaroTime3
local time2 = Config.RepairEngineTime
local time3 = Config.RepairEngineNoobTime
local time4 = Config.SpongeTime
carotime1 = carotime1/60
carotime1 = carotime1*60000
carotime2 = carotime2/60
carotime2 = carotime2*60000
carotime3 = carotime3/60
carotime3 = carotime3*60000
time2 = time2/60
time2 = time2*60000
time3 = time3/60
time3 = time3*60000
time4 = time4/60
time4 = time4*60000
local onrepair = 0

RegisterNetEvent('mcd_repairkit:onrepairkit_caro')
AddEventHandler('mcd_repairkit:onrepairkit_caro', function(_source, xPlayer)
local playerPed = PlayerPedId()
local coords = GetEntityCoords(playerPed)
local vehdoors = 0
local vehicle
if(onrepair == 0) then
if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	end

	if DoesEntityExist(vehicle) then
	local vbhealth = GetVehicleBodyHealth(vehicle)
	local vhealth = GetVehicleEngineHealth(vehicle)
	local fuel = GetVehicleFuelLevel(vehicle)
	local dirt = GetVehicleDirtLevel(vehicle)
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_HAMMERING', 0, true)
	onrepair = 1
	if(vbhealth >= 750) then
	carotime = carotime1
	elseif(vbhealth >= 500) then
		carotime = carotime2
	elseif(vbhealth <= 499) then
		carotime = carotime3
	else
		carotime = carotime3
	end
	Citizen.CreateThread(function()
		Citizen.Wait(carotime)
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleBodyHealth(vehicle, 1000.0)
		SetVehicleEngineHealth(vehicle, vhealth)
		SetVehicleFuelLevel(vehicle, fuel)
		SetVehicleDirtLevel(vehicle, dirt)
		SetVehicleUndriveable(vehicle, false)
		TriggerEvent('pNotify:SendNotification', {
			text = {_U('repaired_caro')}
		})
		ClearPedTasksImmediately(playerPed)
		onrepair = 0
	end)
end
end
else
	TriggerEvent('pNotify:SendNotification', {
		text = {_U('allreadydosomthing')}
	})
end
end)
--
RegisterNetEvent('mcd_repairkit:onrepairkit_engine')
AddEventHandler('mcd_repairkit:onrepairkit_engine', function(_source, xPlayer)
local playerPed = PlayerPedId()
local coords = GetEntityCoords(playerPed)
local vehdoors = 0
local vehicle
if(onrepair == 0) then
if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	end

	if DoesEntityExist(vehicle) then
	local vhealth = GetVehicleEngineHealth(vehicle)
	local isrepairing = 0
	if(vhealth >= 5) then
	TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
	onrepair = 1
	isrepairing = 1
	vehdoors = GetNumberOfVehicleDoors(vehicle)
	Citizen.CreateThread(function()
		while true do
		Citizen.Wait(0)
		if(isrepairing == 1) then
		SetVehicleDoorOpen(vehicle, 4, false, false)
		end end
	end)
	Citizen.CreateThread(function()
		Citizen.Wait(time2)
		SetVehicleEngineHealth(vehicle,1000.0)
		SetVehicleUndriveable(vehicle, false)
		TriggerEvent('pNotify:SendNotification', {
			text = {_U('repaired_engin')}
		})
		ClearPedTasksImmediately(playerPed)
		onrepair = 0
		isrepairing = 0
		SetVehicleDoorShut(vehicle, 4, false)
	end)
	else
	TriggerEvent('pNotify:SendNotification', {
		text = {_U('vehicledamaged')}
	})			
	end end
end
else
	TriggerEvent('pNotify:SendNotification', {
		text = {_U('allreadydosomthing')}
	})
end
end)










local rndmtxt1 = _U('rndmtxt1')
local rndmtxt2 = _U('rndmtxt2')
local rndmtxt3 = _U('rndmtxt3')
local rndmtxt4 = _U('rndmtxt4')
local rndmtxt5 = _U('rndmtxt5')

local rndmtxtes = Config.RandomTextes

RegisterNetEvent('mcd_repairkit:onrepairkit_noob')
AddEventHandler('mcd_repairkit:onrepairkit_noob', function(_source, xPlayer)
local playerPed = PlayerPedId()
local coords = GetEntityCoords(playerPed)
local vehdoors = 0
local vehicle
if(onrepair == 0) then
if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	end

	if DoesEntityExist(vehicle) then
	local vhealth = GetVehicleEngineHealth(vehicle)
	local isrepairing = 0
	local randomtxt = math.random(1,rndmtxtes)
	if(vhealth >= 5) then
	local allowed = 0
	local allowedd = 1
	local newhealth = vhealth
	if(vhealth >= 500) then
		newhealth = 749.0
		allowed = 1
	elseif(vhealth >= 250) then
		newhealth = 499.0
		allowed = 1
	elseif(vhealth <= 250) then
		allowed = 0
	end
	if(vhealth == 499) then
		allowed = 0
		TriggerEvent('pNotify:SendNotification', {
			text = {_U('morecantdo')}
		})
		allowedd = 0
	end
	if(allowed == 1) then
	TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
	onrepair = 1
	isrepairing = 1
	vehdoors = GetNumberOfVehicleDoors(vehicle)
	Citizen.CreateThread(function()
		while true do
		Citizen.Wait(0)
		if(isrepairing == 1) then
		SetVehicleDoorOpen(vehicle, 4, false, false)
		end end
	end)
	Citizen.CreateThread(function()
		Citizen.Wait(time3)
		SetVehicleEngineHealth(vehicle,newhealth)
		SetVehicleUndriveable(vehicle, false)
		TriggerEvent('pNotify:SendNotification', {
			text = {_U('stilldamaged')}
		})
		ClearPedTasksImmediately(playerPed)
		onrepair = 0
		isrepairing = 0
		SetVehicleDoorShut(vehicle, 4, false)
		if(randomtxt == 1) then
		TriggerEvent('pNotify:SendNotification', { text = {rndmtxt1} })
		elseif(randomtxt == 2) then
		TriggerEvent('pNotify:SendNotification', { text = {rndmtxt2} })
		elseif(randomtxt == 3) then
		TriggerEvent('pNotify:SendNotification', { text = {rndmtxt3} })
		elseif(randomtxt == 4) then
		TriggerEvent('pNotify:SendNotification', { text = {rndmtxt4} })
		elseif(randomtxt == 5) then
		TriggerEvent('pNotify:SendNotification', { text = {rndmtxt5} })
		end
	end)
	elseif(allowedd == 1) then
	TriggerEvent('pNotify:SendNotification', {
		text = {_U('vehicledamaged')}
	})
	end

	else
	TriggerEvent('pNotify:SendNotification', {
		text = {_U('vehicledamaged')}
	})			
	end end
end
else
	TriggerEvent('pNotify:SendNotification', {
		text = {_U('allreadydosomthing')}
	})
end
end)
local commandon = Config.Checkcommand
local commandon2 = 0
if(commandon == true) then
	commandon2 = 1
else
	commandon2 = 0
end

RegisterCommand('checkvehicle', function()
if(commandon2 == 1) then
	local playerPed = PlayerPedId()
local coords = GetEntityCoords(playerPed)
local ischecking = 0
if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
	if(onrepair == 0) then

	local vehicle

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	end

	if DoesEntityExist(vehicle) then
		TriggerEvent('chat:addMessage', {
			color = { 255, 0, 0},
		   multiline = true,
	   args = {"Check", _U('checkvehicle')}
	   })

		TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
		ischecking = 1
		onrepair = 1
		vehdoors = GetNumberOfVehicleDoors(vehicle)
		Citizen.CreateThread(function()
			while true do
			Citizen.Wait(0)
			if(ischecking == 1) then
			SetVehicleDoorOpen(vehicle, 4, false, false)
			end
		end
		end)

		Citizen.CreateThread(function()
			Citizen.Wait(30000)
			local EngineHealth = GetVehicleEngineHealth(vehicle)
			local EngineTemperature = GetVehicleEngineTemperature(vehicle)
			local BodyHealth = GetVehicleBodyHealth(vehicle)
			local FuelLevel = GetVehicleFuelLevel(vehicle)
			local OilLevel = GetVehicleOilLevel(vehicle)
			local PetrolTankHealth  = GetVehiclePetrolTankHealth(vehicle)
			local repairkit = 0
			if(EngineHealth <= 250) then
				repairkit = 0
			elseif(EngineHealth >= 750) then
				repairkit = 0
			else
				repairkit = 1
			end


			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   args = {"Check EngineHealth", EngineHealth}
		   })
			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   args = {"Check EngineTemperature", EngineTemperature}
		   })
			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   args = {"Check BodyHealth", BodyHealth}
		   })
			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   args = {"Check FuelLevel", FuelLevel}
		   })
			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   args = {"Check OilLevel", OilLevel}
		   })
			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   	args = {"Check PetrolTankHealth", PetrolTankHealth}
		   })
		   if(repairkit == 1) then
			TriggerEvent('chat:addMessage', {
				color = { 0, 255, 0},
			   multiline = true,
		   	args = {"Check Repairkit", _U('recommended')}
		   })
		   else
			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   	args = {"Check Repairkit", _U('notrecommended')}
		   })
			end
			ClearPedTasksImmediately(playerPed)
			ischecking = 0
			onrepair = 0
			SetVehicleDoorShut(vehicle, 4, false)
		end)
	else
		TriggerEvent('chat:addMessage', {
			color = { 255, 0, 0},
		   multiline = true,
	   args = {"Check", _U('novehiclenearby')}
	   })
	   ischecking = 0
	   onrepair = 0
	end
	else
		TriggerEvent('pNotify:SendNotification', {
			text = {_U('allreadydosomthing')}
		})
		
	end
end
else
	TriggerEvent('chat:addMessage', {
		color = { 255, 0, 0},
		multiline = true,
		args = {"ERROR", _U('errorcommand')}
	})
end
end,false)

--------------------------------------------------------------------------

	RegisterNetEvent('mcd_repairkit:onsponge')
	AddEventHandler('mcd_repairkit:onsponge', function(_source, xPlayer)
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local source = playerPed
	local vehdoors = 0
	local vehicle
	if(onrepair == 0) then
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
	
		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end
	
		if DoesEntityExist(vehicle) then
		TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
		onrepair = 1
		Citizen.CreateThread(function()
			Citizen.Wait(time4)
			SetVehicleDirtLevel(vehicle, 0)
			SetVehicleUndriveable(vehicle, false)
			TriggerEvent('pNotify:SendNotification', {
				text = {_U('cleanedvehicle')}
			})
			ClearPedTasksImmediately(playerPed)
			onrepair = 0
		end)
 		end
	end
	else
		TriggerEvent('pNotify:SendNotification', {
			text = {_U('allreadydosomthing')}
		})
	end
	end)
--------------------------------------------------------------------------

RegisterNetEvent('speedcheck2')
AddEventHandler('speedcheck2', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local ischecking = 0
	
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		if(onrepair == 0) then
		local vehicle
	
		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end
	
		if DoesEntityExist(vehicle) then
			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   args = {"Check", "Speed Checke das Fahrzeug..."}
		   })
	
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
			ischecking = 1
			onrepair = 1
			vehdoors = GetNumberOfVehicleDoors(vehicle)
			Citizen.CreateThread(function()
				while true do
				Citizen.Wait(0)
				if(ischecking == 1) then
				SetVehicleDoorOpen(vehicle, 4, false, false)
				print(test)
				end
				end
			end)
	
			Citizen.CreateThread(function()
				Citizen.Wait(1000)
				onrepair = 0
				local EngineHealth = GetVehicleEngineHealth(vehicle)
				local EngineTemperature = GetVehicleEngineTemperature(vehicle)
				local BodyHealth = GetVehicleBodyHealth(vehicle)
				local vbhealth = GetVehicleBodyHealth(vehicle)
				local FuelLevel = GetVehicleFuelLevel(vehicle)
				local OilLevel = GetVehicleOilLevel(vehicle)
				local PetrolTankHealth  = GetVehiclePetrolTankHealth(vehicle)
				TriggerEvent('chat:addMessage', {
					color = { 255, 0, 0},
				   multiline = true,
			   args = {"Check EngineHealth", EngineHealth}
			   })
				TriggerEvent('chat:addMessage', {
					color = { 255, 0, 0},
				   multiline = true,
			   args = {"Check EngineTemperature", EngineTemperature}
			   })
				TriggerEvent('chat:addMessage', {
					color = { 255, 0, 0},
				   multiline = true,
			   args = {"Check BodyHealth", BodyHealth}
			   })
			   TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   		args = {"Check vbhealth", vbhealth}
		   		})
				TriggerEvent('chat:addMessage', {
					color = { 255, 0, 0},
				   multiline = true,
			   args = {"Check FuelLevel", FuelLevel}
			   })
				TriggerEvent('chat:addMessage', {
					color = { 255, 0, 0},
				   multiline = true,
			   args = {"Check OilLevel", OilLevel}
			   })
				TriggerEvent('chat:addMessage', {
					color = { 255, 0, 0},
				   multiline = true,
			   args = {"Check PetrolTankHealth", PetrolTankHealth}
			   })

				ClearPedTasksImmediately(playerPed)
				ischecking = 0
				onrepair = 0
				SetVehicleDoorShut(vehicle, 4, false)
			end)
		else
			TriggerEvent('chat:addMessage', {
				color = { 255, 0, 0},
			   multiline = true,
		   args = {"Check", _U('novehiclenearby')}
		   })
		   ischecking = 0
		   onrepair = 0
		end

		else
			TriggerEvent('pNotify:SendNotification', {
				text = {_U('allreadydosomthing')}
			})
		end
	end
end)
