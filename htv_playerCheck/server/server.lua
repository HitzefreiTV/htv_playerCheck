RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Async.fetchAll('SELECT accepted FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
        if result[1].accepted == 1 then
            TriggerClientEvent("htv_playerCheck:NewPlayer", _source, true)
        else
            TriggerClientEvent("htv_playerCheck:NewPlayer", _source, false)
        end
    end)
end)

RegisterCommand("acceptplayer", function(source, args)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(args[1])

    if zPlayer then
        local isTeamler = false
        local PlayerGroup = xPlayer.getGroup()
        for i=1, #TeamRanks do
            if TeamRanks[i] == PlayerGroup then
                isTeamler = true
            end
        end

        if  isTeamler then
            TriggerClientEvent('esx:showNotification', zPlayer.source, Translation.Accepted)
            TriggerClientEvent("htv_playerCheck:NewPlayer", args[1], false)
            MySQL.Sync.execute("UPDATE users SET neu = 0 WHERE identifier = @identifier", {
                ['@identifier'] = zPlayer.identifier
            })
        end
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, Translation.NoValidPlayer)
    end
end)
