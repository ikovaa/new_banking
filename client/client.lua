--================================================================================================--
--==                                VARIABLES - DO NOT EDIT                                     ==--
--================================================================================================--
ESX                         = nil
inMenu                      = true
local atbank = false
local bankMenu = true

local keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

--================================================================================================
--==                                THREADING - DO NOT EDIT                                     ==
--================================================================================================

--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--===============================================
--==             Map Blips	                   ==
--===============================================

--BANK
Citizen.CreateThread(function()
	if Config.ShowBlips then
	  for k,v in ipairs(Config.Bank)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (blip, Config.Id)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 2)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U("bank_blip"))
		EndTextCommandSetBlipName(blip)
	  end
	end
end)


local atmFleeca = {
    `prop_fleeca_atm`,
    `prop_atm_03`,
    `prop_atm_01`,
    `prop_atm_02`,
}

exports['bt-target']:AddTargetModel(atmFleeca, {
    options = {
        {
            event = "banking:showMeMoney",
            icon = "fas fa-credit-card",
            label = "Use ATM",
        },
    },
    job = {"all"},
    distance = 1.5
})

-- Banks

exports['bt-target']:AddBoxZone("Pacific-standard", vector3(247.66, 223.78, 106.29), 0.5, 12.5, {
	name= "Pacific-standard",
	heading= 342.50,
	debugPoly= false,
	minZ= 105.29,
	maxZ= 106.99
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 3.0
})

exports['bt-target']:AddBoxZone("Hawick Avenu-Bank", vector3(313.84, -279.69, 53.37), 1.0, 3.8, {
	name= "bennys-shop",
	heading= 163.17,
	debugPoly= false,
	minZ= 53.27,
	maxZ= 54.99
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 2.5
})

exports['bt-target']:AddBoxZone("Hawick Avenue-Bank2", vector3(-351.82, -50.28, 48.54), 1.0, 3.8, {
	name= "Hawick Avenue-Bank2",
	heading= 180.00,
	debugPoly= false,
	minZ= 48.44,
	maxZ= 49.99
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 2.5
})

exports['bt-target']:AddBoxZone("Boulevard Del-Perro-Bank", vector3(-1212.96, -331.67, 37.79), 1.5, 4.0, {
	name= "Boulevard Del-Perro-Bank",
	heading= 207.85,
	debugPoly= false,
	minZ= 37.00,
	maxZ= 38.00
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 3.5
})

exports['bt-target']:AddBoxZone("Vespucci Boulevard-Bank", vector3(149.06, -1041.02, 28.47), 1.0, 3.8, {
	name= "Vespucci Boulevard-Bank",
	heading= 160.00,
	debugPoly= false,
	minZ= 28.44,
	maxZ= 29.99
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 2.5
})

exports['bt-target']:AddBoxZone("Great Ocean Highway-Bank", vector3(-2962.18, 482.17, 15.5), 1.0, 3.8, {
	name= "Great Ocean Highway-Bank",
	heading= 269.57,
	debugPoly= false,
	minZ= 14.44,
	maxZ= 15.99
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 2.5
})

exports['bt-target']:AddBoxZone("Route 68-Bank", vector3(1175.67, 2707.55, 37.89), 1.0, 3.8, {
	name= "Route 68-Bank",
	heading= 0.57,
	debugPoly= false,
	minZ= 37.19,
	maxZ= 38.99
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 2.5
})

exports['bt-target']:AddBoxZone("Grapeseed-Bank", vector3(1652.55, 4851.05, 41.82), 1.0, 3.8, {
	name= "Grapeseed-Bank",
	heading= 97.14,
	debugPoly= false,
	minZ= 41.69,
	maxZ= 42.99
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 2.5
})

exports['bt-target']:AddBoxZone("Blaine County Savings-Bank", vector3(-112.07, 6470.23, 30.82), 1.0, 3.8, {
	name= "Blaine County Savings-Bank",
	heading= 316.09,
	debugPoly= false,
	minZ= 30.69,
	maxZ= 31.99
}, {
	options = {
	{
	event = 'banking:showMeBankMoney',
	icon = "fas fa-money-bill-wave",
	label = "Access Bank Account.",
	},
},
	job = {"all"},
	distance = 2.5
})


RegisterNetEvent('banking:showMeBankMoney')
AddEventHandler('banking:showMeBankMoney', function()
	openUI() --if this doesn't work then drop the contents of the openUI() function at the bottom and call it a day.
end)


--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)

	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bank:deposit', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bank:withdraw', tonumber(data.amountw))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:transfer', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Result   Event                    ==
--===============================================
RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
	closeUI()
end)

AddEventHandler('onResourceStop', function (resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	closeUI()
end)

AddEventHandler('onResourceStart', function (resourceName)
	if(GetCurrentResourceName() ~= resourceName) then
		return
	end
	closeUI()
end)


--===============================================
--==            Capture Bank Distance          ==
--===============================================

RegisterCommand("atm", function()

	if nearATM() then
		openUI()
	else
		exports['mythic_notify']:SendAlert('inform', _U("anyatm_near"), 2500)
	end
end, false)

RegisterCommand("bank", function()

	if nearBank() then
		openUI()
	else
		exports['mythic_notify']:SendAlert('inform', _U("anybank_near"), 2500)
	end
end, false)

RegisterCommand("closebank", function()

	closeUI()

end, false)


function nearBank()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(Config.Bank) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 1 then
			return true
		end
	end
end

function nearATM()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(Config.ATM) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

		if distance <= 1 then
			return true
		end
	end
end

function closeUI()
	local anim = "mp_common"
	local dict = "givetake1_a"
	local ped = GetPlayerPed(-1)
	inMenu = false
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
	if Config.Animation.Active then
		if Config.ProgressBars then
			exports['progressBars']:startUI(Config.Animation.Time, _U("remove_card"))
		end
		playAnim(anim, dict, Config.Animation.Time)
		Citizen.Wait(Config.Animation.Time)
		FreezeEntityPosition(ped, false)
		Citizen.Wait(Config.Animation.Time)
	end
end

function openUI()
	local ped = GetPlayerPed(-1)
	if Config.Animation.Active then
		if Config.ProgressBars then
			exports['progressBars']:startUI(Config.Animation.Time, _U("insert_card"))
		end
		FreezeEntityPosition(ped, true)
		playAnim('mp_common', 'givetake1_a', Config.Animation.Time)
		Citizen.Wait(Config.Animation.Time)
		end
		inMenu = true
		SetNuiFocus(true, true)
		SendNUIMessage({type = 'openGeneral'})
		TriggerServerEvent('bank:balance')
end
