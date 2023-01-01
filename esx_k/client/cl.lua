ESX              = nil
local PlayerData = {}
palkinto = Config.Palkinto
local random = math.random(1, #Config.Location3)
local coordkohde = Config.Location3[random].coords


local cd = Config.COOLDOWN -- minuutteina

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if t then
            Citizen.Wait(cd * 60000) 
        t = false
      end
    end
end)





Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



Citizen.CreateThread(function(success)
	local	 alotus = Config.Location
--blip
paikka = AddBlipForCoord(alotus.x, alotus.y, alotus.z)
SetBlipSprite(paikka, 457)
SetBlipScale(paikka, 0.5)
SetBlipColour(paikka, 1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Varastokontinryöstö')
		EndTextCommandSetBlipName(paikka)	
			SetBlipAsShortRange(paikka, true)
			---
	RequestModel( GetHashKey( "mp_m_waremech_01" ) )
	while ( not HasModelLoaded( GetHashKey( "mp_m_waremech_01" ) ) ) do
		Citizen.Wait(1)
	end
npcluonti = 	CreatePed(4, 'mp_m_waremech_01', alotus.x, alotus.y, alotus.z, 309.00, false, true)
	FreezeEntityPosition(npcluonti,true)
	SetBlockingOfNonTemporaryEvents(npcluonti, true)
	SetEntityInvincible(npcluonti, true)
	SetEntityAsMissionEntity(npcluonti)
	while true do		
Wait(1500) -- chekkaa etäisyys 
	local ped = PlayerPedId(-1)
local	coords = GetEntityCoords(ped)
local	dist = GetDistanceBetweenCoords(alotus.x, alotus.y, alotus.z, coords.x, coords.y, coords.z, true)
if dist < 3.0 then
	lahel = true
else
	lahel = false
end
if lahel then
	while true do
		Wait(5)
			 rand = math.random(3, 5)
			 rand2 = math.random(15, 25)
			 numerot2 = rand2
			 numerot = rand
		local ped = PlayerPedId(-1)
		local	coords = GetEntityCoords(ped)
		local	dist = GetDistanceBetweenCoords(alotus.x, alotus.y, alotus.z, coords.x, coords.y, coords.z, true)
		if dist < 3.0 then 
		Draw3DText(alotus.x, alotus.y, alotus.z, 'Paina ~r~ [E] ~w~ Saadaksesi ryöstö kohde', 0.4) 
	if dist	and IsControlJustReleased(1, 38) then
		if not t then
TriggerServerEvent('esx_ek_vkrobbery:tabletti')
		else
			ESX.ShowNotification('Etsin vielä seuraavaa ryöstö kohdetta!, koita kohta uudestaan!', false, false, r)
end
end
else
	break
end
end
end
end
end)

RegisterNetEvent('esx_ek_vkrobbery:sorkkarauta')
AddEventHandler('esx_ek_vkrobbery:sorkkarauta', function(source)
	print('homo')
	ESX.ShowNotification('Tarvitset Sorkkaradan aloittaaksesi!',false,  false, r)
end)


RegisterNetEvent('esx_ek_vkrobbery:hack')
AddEventHandler('esx_ek_vkrobbery:hack', function(xPlayer)
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start",numerot, numerot2 ,mycb, success) 
	t = true
end, false)




RegisterNetEvent('gps')
AddEventHandler('gps', function()
	--local kohde = Config.Location2
	local pressed = IsControlJustReleased(1, 38)
	while true do
		Citizen.Wait(5)
			local ped = PlayerPedId(-1)
			local coords = GetEntityCoords(ped)
			local dist = GetDistanceBetweenCoords(coordkohde.x, coordkohde.y, coordkohde.z, coords.x, coords.y, coords.z, true )
			if dist < 4.0 then
			Draw3DText(coordkohde.x, coordkohde.y, coordkohde.z, 'Paina ~r~ [E] ~w~ Varastaaksesi ', 0.4)
			if IsControlJustReleased(1, 38) then
				print('varastellaaas')
				TriggerServerEvent('esx_ek_vkrobbery:poupou')
				TriggerEvent("mythic_progbar:client:progress", {
					name = "unique_action_name",
					duration = Config.Aika*1000,
					label = "Tutkitaan...",
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					},
					animation = {
						--animDict = "missheistdockssetup1clipboard@idle_a",
						anim = "idle_a",
					},
					prop = {
						model = "w_me_crowbar",
					}
				}, function(status)
					if not status then
						TriggerServerEvent('esx_ek_vkrobbery:palkinto')
						TriggerEvent('esx_ek_vkrobbery:blipp')
						TriggerServerEvent('esx_ek_vkrobbery:poupou2')
						ESX.ShowNotification('~r~ Löysit kontista jotain...', false, true, 1)
					else 
TriggerEvent('esx_ek_vkrobbery:blipp')
TriggerServerEvent('esx_ek_vkrobbery:poupou2')
					end
				end)
return
				end 
		end 
	end
end)




--jatkuu 

RegisterNetEvent('jatkuu')
AddEventHandler('jatkuu', function()
print('gps asetettu')
	ClearGpsPlayerWaypoint()
	SetNewWaypoint(coordkohde.x, coordkohde.y) 
 	TriggerEvent('gps') 
	 TriggerEvent('alotettu')
	 TriggerEvent('luokohde')
end)

--drawtext
function Draw3DText(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(true)
	SetTextColour(255, 255, 255, 215)
	AddTextComponentString(text)
	DrawText(_x, _y)
	local factor = (string.len(text)) / 700
	DrawRect(_x, _y + 0.0150, 0.06 + factor, 0.03, 41, 11, 41, 100)
end






--gps laitto ja noti
RegisterNetEvent('alotettu')
AddEventHandler('alotettu', function()
    ESX.ShowAdvancedNotification(
    rawCommand,
    'Sait GPS',
    'Osoitteen varastokontin sijainnista',
    'CHAR_LJT',
    140, 
    true
    )
end)








--mhacking
function mycb(success, timeremaining)
	if success then
		print('Success with '..timeremaining..'s remaining.')
		TriggerEvent('mhacking:hide')
		TriggerEvent('jatkuu')
	else
		print('Failure')
		TriggerEvent('mhacking:hide')
		ESX.ShowNotification('Epäonnistuit yritä myöhemmin uudelleen', false, false, r)
	end
end




--hälyt
RegisterNetEvent('esx_ek_vkrobbery:alarm')
AddEventHandler('esx_ek_vkrobbery:alarm', function()
	local ped = PlayerPedId(-1)
blipRobbery = AddBlipForCoord(coordkohde.x, coordkohde.y, coordkohde.z)
ESX.ShowNotification('Varastokonttia ryöstetään!', false, false, r)
SetBlipSprite(blipRobbery, 161)
SetBlipScale(blipRobbery, 2.0)
SetBlipColour(blipRobbery, 3)
PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_ek_vkrobbery:stopalarm')
AddEventHandler('esx_ek_vkrobbery:stopalarm', function()
ESX.ShowNotification('Varastokontin ryöstö lopetettu', false, false, r)
end)

RegisterNetEvent('esx_ek_vkrobbery:blipp')
AddEventHandler('esx_ek_vkrobbery:blipp', function()
RemoveBlip(blipRobbery)
end)
