local QBCore = exports['qb-core']:GetCoreObject()

local function ShowNotification(source, msg, type)
    TriggerClientEvent('QBCore:Notify', source, msg, type)
end


CreateThread(function()
    for k, v in pairs(Config.Wallets) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            if item.info == nil or item.info.walletid == nil then
                ShowNotification(source, "Invalid Item, Contact administrator", "error")
                return
            end
            TriggerClientEvent('lb-wallet:client:openWallet', source, item.info.walletid, v.size, v.slots)
        end)
    end
end)

RegisterServerEvent('lb-wallet:server:buyWallet', function(data)
    local source = source
    local price = data.price
    local item = data.item
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {}
    info.walletid = item.."_"..tostring(QBCore.Shared.RandomInt(5) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(6))
    if Player.Functions.RemoveMoney("cash", price) then
        if Player.Functions.AddItem(item, 1, nil, info) then
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item], "add")
        else
            ShowNotification(source, "Inventory Full", "error")
        end
    else
        ShowNotification(source, "Not Enough money, required cash: "..price.."$" , "error")
    end
end)