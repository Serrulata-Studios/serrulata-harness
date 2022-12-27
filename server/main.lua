local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.HernessItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('seatbelt:client:useHarnessItemAdd', source)
end)

QBCore.Functions.CreateUseableItem(Config.HarnessRemoverItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('seatbelt:client:useHarnessItemRemove', source)
end)

function IsVehicleOwned(plate)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    return result
end

RegisterNetEvent('qb-samllresources:server:hasHarness', function(plate)
    local src = source
    MySQL.Async.fetchScalar('SELECT hasharness FROM player_vehicles WHERE plate = ?', { plate },
    function(state)
        if state == 1 then
            TriggerClientEvent('seatbelt:client:toggleHarness', src)
        else
            TriggerClientEvent('seatbelt:client:Togglebelt', src)
        end
    end)
end)

RegisterNetEvent('seatbelt:server:AddHarnessToVehicle', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if IsVehicleOwned(plate) then
        MySQL.Async.fetchScalar('SELECT hasharness FROM player_vehicles WHERE plate = ?', { plate },
        function(state)
            if state == 1 then
                TriggerClientEvent('QBCore:Notify', src, 'Harness Already Attacted', 'error')
            else
                local hasharness = 1 
                MySQL.Async.execute('UPDATE player_vehicles SET hasharness = ? WHERE plate = ?', {hasharness, plate})                
                TriggerClientEvent('seatbelt:client:AddedHarnessToVehicle', src)
                Player.Functions.RemoveItem('harness', 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items['harness'], 'remove')
            end
        end)
    else
        TriggerClientEvent('QBCore:Notify', src, 'this vehicle isnt owned!...', 'error')
    end
end)

RegisterNetEvent('seatbelt:server:RemoveHarnessToVehicle', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if IsVehicleOwned(plate) then
        MySQL.Async.fetchScalar('SELECT hasharness FROM player_vehicles WHERE plate = ?', { plate },
        function(state)
            if state == 1 then
                TriggerClientEvent('seatbelt:client:RemovedHarnessToVehicle', src)
                Player.Functions.AddItem('harness', 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items['harness'], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'Harness Not Found!', 'error')
            end
        end)
    else
        TriggerClientEvent('QBCore:Notify', src, 'this vehicle isnt owned!...', 'error')
    end
end)

RegisterNetEvent('seatbelt:server:RemovedHarnessToVehicleSuccess', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasharness = 0 
    MySQL.Async.execute('UPDATE player_vehicles SET hasharness = ? WHERE plate = ?', {hasharness, plate})                
    Player.Functions.AddItem(Config.HernessItem, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[Config.HernessItem], 'add')
end)
