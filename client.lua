-- local QBCore = exports['qb-core']:GetCoreObject()


RegisterCommand('livery', function(source, args)
    local livery = tonumber(args[1])
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    local count = GetVehicleLiveryCount(veh)
    local inveh = IsPedInAnyVehicle(ped, false)

    if inveh then
        if livery <= count and livery ~= 0 then
            SetVehicleLivery(veh, livery)

        else
            -- QBCore.Functions.Notify("Invalid Livery", "error")
        end
    else
        -- QBCore.Functions.Notify("You are not in vehicle", "error")
    end
end)

CreateThread(function()
    while true do
        Citizen.Wait(4000)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        local count = GetVehicleLiveryCount(veh)
        local inveh = IsPedInAnyVehicle(ped, false)

        local text = {}

        if inveh and count ~= -1 then
            text = string.format("Este vehículo tiene %d livery", count)

        elseif inveh and count == -1 then
            text = "Este vehículo no tiene livery"

        else
            text = "You are not in vehicle"
        end


        TriggerEvent('chat:addSuggestion', '/livery', 'Cambiar livery', {
            { name="livery", help=text },
        })
    end
end)
