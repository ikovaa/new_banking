-- ================================================================================================--
-- ==                                VARIABLES - DO NOT EDIT                                     ==--
-- ================================================================================================--
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
    local _source = source

    local xPlayer = ESX.GetPlayerFromId(_source)
    if amount <= 0 then
	if Config.UseMythic then
        	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U("invalid_amount"), length = 2500})
	end
    else
        if amount > xPlayer.getMoney() then
            amount = xPlayer.getMoney()
        end
        xPlayer.removeMoney(amount)
        xPlayer.addAccountMoney('bank', tonumber(amount))
    end
	if Config.UseMythic then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U("deposit") .. amount, length = 2500})
	end
end)

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local base = 0
    amount = tonumber(amount)
    base = xPlayer.getAccount('bank').money
    if amount <= 0 then
	if Config.UseMythic then
        	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = _U("invalid_amount"), length = 2500})
	end
    else
        if amount > base then
            amount = base
        end
        xPlayer.removeAccountMoney('bank', amount)
        xPlayer.addMoney(amount)
    end
	if Config.UseMythic then
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U("withdraw") .. amount, length = 2500})
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    balance = xPlayer.getAccount('bank').money
    TriggerClientEvent('currentbalance1', _source, balance)

end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(to)
    local balance = 0
    	if zPlayer ~= nil and GetPlayerEndpoint(to) ~= nil then
		balance = xPlayer.getAccount('bank').money
		zbalance = zPlayer.getAccount('bank').money
		if tonumber(_source) == tonumber(to) then
			if Config.UseMythic then
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = _U("nice_try"), length = 2500})
			end
		else
		    	if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
				if Config.UseMythic then
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = _U("invalid_amount"), length = 2500})
				end
		    	else
				xPlayer.removeAccountMoney('bank', tonumber(amountt))
				zPlayer.addAccountMoney('bank', tonumber(amountt))
					
				if Config.UseMythic then
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U("transfered") .. amount .. _U('to') .. to, length = 2500})
					TriggerClientEvent('mythic_notify:client:SendAlert', to, { type = 'success', text = _U("recived") .. amount .. _U('from') .. _source, length = 2500})
				end
		    	end

		end
	else
			if Config.UseMythic then
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = _U("not_found"), length = 2500})
			end
    	end

end)
