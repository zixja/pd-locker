local QBCore = exports['qb-core']:GetCoreObject()
local lockerPrefix = "pdlocker_"

QBCore.Functions.CreateCallback("pdlocker:GetLockerName", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local stashName = lockerPrefix .. Player.PlayerData.citizenid
        cb(stashName)
    else
        cb(nil)
    end
end)
