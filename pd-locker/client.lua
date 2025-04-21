local QBCore = exports['qb-core']:GetCoreObject()

local lockerCoords = vector3(460.5786, -995.896, 30.689) -- Change to your locker spot

exports['qb-target']:AddBoxZone("pd_locker", lockerCoords, 1.2, 1.0, {
    name = "pd_locker",
    heading = 90,
    debugPoly = false,
    minZ = 29.69,
    maxZ = 31.29,
}, {
    options = {
        {
            type = "client",
            event = "pdlocker:openLocker",
            icon = "fas fa-box",
            label = "Open PD Locker",
            job = "police"
        },
    },
    distance = 2.0
})

RegisterNetEvent("pdlocker:openLocker", function()
    QBCore.Functions.TriggerCallback("pdlocker:GetLockerName", function(lockerName)
        if lockerName then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", lockerName, {
                maxweight = 200000,
                slots = 40
            })
            TriggerEvent("inventory:client:SetCurrentStash", lockerName)
        else
            QBCore.Functions.Notify("Locker not found", "error")
        end
    end)
end)
