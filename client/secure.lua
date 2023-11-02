local QBCore = exports['qb-core']:GetCoreObject()
local secure = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('yoo:checksecure', function(status)
        Citizen.Wait(50)
        secure = status
    end)
end)

RegisterNetEvent('yoo:secure:client:setSecureStatus')
AddEventHandler('yoo:secure:client:setSecureStatus', function(status)
    secure = status
end)

function GetSecureStatus(toggleNotif)
    if secure then
        if toggleNotif ~= false then
            QBCore.Functions.Notify("Güvenlik sistemleri devrede.", "error", 3000)
        end
    end
    return secure
end

RegisterCommand('checksecure', function()
    if secure then
        QBCore.Functions.Notify("Güvenlik sistemleri devrede.", "error", 3000)
    else
        QBCore.Functions.Notify("Güvenlik sistemleri devre dışı", "success", 3000)
    end
end)

RegisterCommand("securetest", function()
    if not exports['yoo-secure']:GetSecureStatus() then
        QBCore.Functions.Notify("Soygunu başarıyla gerçekleştirdin", "success")
    else
        QBCore.Functions.Notify("Güvenlik Sistemleri Devrede", "error")
    end 
end)
