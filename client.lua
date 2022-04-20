RegisterCommand('spawn', function(source, args)
    -- if no arg is passed
    local vehName = args[1] or 'adder'

    -- check if the vehicle actually exists
    if not IsModelInCdimage(vehName) or not IsModelInCdimage(vehName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Vehicle does not exist: ' .. vehName }
        })
        return
    end

    -- get the players pos
    local playerPed = PlayerPedId() -- get the local player ped
    local pos = GetEntityCoords(playerPed) -- get the pos of the local player ped

    -- get the vehicle the player is in
    local oldVeh = GetVehiclePedIsIn(playerPed, false)

    -- delete the vehicle
    DeleteEntity(oldVeh)

    -- load the model
    RequestModel(vehName)

    -- wait for the model to load
    while not HasModelLoaded(vehName) do
        Wait(500)
    end

    -- create the vehicle
    local veh = CreateVehicle(vehName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    -- put the player into model
    SetPedIntoVehicle(playerPed, veh, -1)

    -- give the vehicle back to the game (this'll make the game decide to despawn the vehicle)
    SetEntityAsNoLongerNeeded(veh)

    -- tell the player
    TriggerEvent('chat:addMessage', {
        args = { 'Vehicle spawned: ' .. vehName }
    })

    -- release the model
    SetModelAsNoLongerNeeded(vehName)
end, false)

RegisterCommand('polmav', function(source, args)
    -- polmav
    local vehName = 'polmav'

    -- get the players pos
    local playerPed = PlayerPedId() -- get the local player ped
    local pos = GetEntityCoords(playerPed) -- get the pos of the local player ped

    -- get the vehicle the player is in
    local oldVeh = GetVehiclePedIsIn(playerPed, false)

    -- delete the vehicle
    DeleteEntity(oldVeh)

    -- load the model
    RequestModel(vehName)

    -- wait for the model to load
    while not HasModelLoaded(vehName) do
        Wait(500)
    end

    -- create the vehicle
    local veh = CreateVehicle(vehName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    -- Set the livery to the police version
    SetVehicleLivery(veh, 0)

    -- put the player into model
    SetPedIntoVehicle(playerPed, veh, -1)

    -- give the vehicle back to the game (this'll make the game decide to despawn the vehicle)
    SetEntityAsNoLongerNeeded(veh)

    -- tell the player
    TriggerEvent('chat:addMessage', {
        args = {'Polmav Spawned'}
    })

    -- release the model
    SetModelAsNoLongerNeeded(vehName)
end, false)

RegisterCommand('dv', function(source, args)
    -- get the local player ped
    local player = PlayerPedId()

    -- get the vehicle the player is in
    local veh = GetVehiclePedIsIn(player, false)

    -- delete the vehicle
    DeleteEntity(veh)
end, false)