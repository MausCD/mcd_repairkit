ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print("Language: " .. Config.Locale)
print("Language: " .. _U('available'))
ESX.RegisterUsableItem('repairkit_engine', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('repairkit_engine', 1)
	TriggerClientEvent('mcd_repairkit:onrepairkit_engine', _source, xPlayer)
	TriggerClientEvent('esx:showNotification', _source, _U('use_repairkit_engine'))
end)

ESX.RegisterUsableItem('repairkit_noob', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('repairkit_noob', 1)
	TriggerClientEvent('mcd_repairkit:onrepairkit_noob', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('use_repairkit_noob'))
end)

ESX.RegisterUsableItem('repairkit_caro', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('repairkit_caro', 1)
	TriggerClientEvent('mcd_repairkit:onrepairkit_caro', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('use_repairkit_caro'))
end)

ESX.RegisterUsableItem('sponge', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('sponge', 1)
	TriggerClientEvent('mcd_repairkit:onsponge', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('use_sponge'))
end)



