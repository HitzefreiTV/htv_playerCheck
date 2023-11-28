local NewPlayer = false

RegisterNetEvent("htv_playerCheck:NewPlayer") 
AddEventHandler("htv_playerCheck:NewPlayer", function(NewStatus)
    NewPlayer = NewStatus
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if NewPlayer then
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            if #(pedCoords, Config.Spawnpoint, true) > 250 then
                SetEntityCoords(ped, Config.Spawnpoint, false, false, false, true)
                ESX.ShowNotification(Translation.NotAccepted)
            end
        end
    end
end)