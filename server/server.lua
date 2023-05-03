local QBCore = exports['qb-core']:GetCoreObject()

local secure = false

QBCore.Functions.CreateCallback("yoo:checksecure", function(source, cb)
    cb(secure)
end)

RegisterCommand("secure", function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.PlayerData.job.name == "police" then
        if secure then
            secure = false
            TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, 'Güvenlik sistemlerini kapattın.', "error")
            TriggerClientEvent("yoo:secure:client:setSecureStatus", -1, false)
        else
            secure = true
            TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, 'Güvenlik sistemlerini açtın.', "success")
            TriggerClientEvent("yoo:secure:client:setSecureStatus", -1, true)
        end
    else
        if secure == true then
            TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, 'Güvenlik sistemleri kapalı.')
        else
            TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, 'Güvenlik sistemleri aktif.')
        end
    end
end, false)





