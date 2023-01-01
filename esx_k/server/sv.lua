ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)






RegisterNetEvent('esx_ek_vkrobbery:palkinto')
AddEventHandler('esx_ek_vkrobbery:palkinto', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local palkinto = Config.Palkinto
	local saatkoaseen = Config.Aseensaanti
	local matikka = math.random(1, 100)
		if matikka >= 1 and matikka <= 50 then
    xPlayer.addAccountMoney('black_money', Config.Palkinto)
		elseif matikka >= 51 and matikka <= 89 then
		xPlayer.addAccountMoney('money', Config.Palkinto)
		elseif matikka >= 90 and matikka <= 100 then
		xPlayer.addWeapon('WEAPON_SNSPISTOL_MK2', 250)
		xPlayer.addAccountMoney('black_money', Config.Palkinto)
		print('saitpas aseen läksi')
	else
end
end)

RegisterNetEvent('esx_ek_vkrobbery:poupou')
AddEventHandler('esx_ek_vkrobbery:poupou', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_ek_vkrobbery:alarm', xPlayers[i], pos)
		end
	end
end)

RegisterNetEvent('esx_ek_vkrobbery:poupou2')
AddEventHandler('esx_ek_vkrobbery:poupou2', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_ek_vkrobbery:stopalarm', xPlayers[i], pos)
		end
	end
end)

RegisterNetEvent('esx_ek_vkrobbery:tabletti')
AddEventHandler('esx_ek_vkrobbery:tabletti', function()
 local xPlayer = ESX.GetPlayerFromId(source) 
 if xPlayer.hasWeapon('WEAPON_CROWBAR') then
	TriggerClientEvent('esx_ek_vkrobbery:hack', source)
else
	print('sorkkisei')
 TriggerClientEvent('esx_ek_vkrobbery:sorkkarauta', source)
end
end)









