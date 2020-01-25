ESX = nil
local info = {stage = 0, style = nil, locked = false}
local blackoutstatus = false
local blackoutdur = 600 -- Duration of blackout in seconds
local cooldown = 3600 -- duration for hitting powerplant again

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("utk_pb:updateUTK")
RegisterServerEvent("utk_pb:removeItem")
RegisterServerEvent("utk_pb:lock")
RegisterServerEvent("utk_pb:handlePlayers")
RegisterServerEvent("utk_pb:blackout")
RegisterServerEvent("utk_pb:checkblackout")

ESX.RegisterServerCallback("utk_pb:GetData", function(source, cb)
    cb(info)
end)
ESX.RegisterServerCallback("utk_pb:checkItem", function(source, cb, itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname)["count"]

    if item >= 1 then
        cb(true)
    else
        cb(false)
    end
end)
AddEventHandler("utk_pb:updateUTK", function(table)
    local xPlayers = ESX.GetPlayers()

    info = {stage = table.info.stage, style = table.info.style, locked = table.info.locked}
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:upUTK", xPlayers[i], table)
    end
end)
AddEventHandler("utk_pb:removeItem", function(item)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(item, 1)
end)
AddEventHandler("utk_pb:lock", function()
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        if xPlayers[i] ~= source then
            TriggerClientEvent("utk_pb:lock_c", xPlayers[i])
        end
    end
end)
AddEventHandler("utk_pb:handlePlayers", function()
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:handlePlayers_c", xPlayers[i])
    end
end)
AddEventHandler("utk_pb:checkblackout", function()
    if blackoutstatus == true then
        TriggerClientEvent("utk_pb:power", source, true)
    end
end)
AddEventHandler("utk_pb:blackout", function(status)
    blackoutstatus = true
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:power", xPlayers[i], status)
    end
    BlackoutTimer()
end)

function BlackoutTimer()
    local timer = blackoutdur
    repeat
        Citizen.Wait(1000)
        timer = timer - 1
    until timer == 0
    blackoutstatus = false
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:power", xPlayers[i], false)
    end
    Cooldown()
end
function Cooldown()
    local timer = cooldown
    repeat
        Citizen.Wait(1000)
        timer = timer - 1
    until timer == 0
    local xPlayers = ESX.GetPlayers()
    info = {stage = 0, style = nil}

    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("utk_pb:reset", xPlayers[i])
    end
end