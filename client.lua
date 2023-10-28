local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("lb-wallet:client:openWallet", function(walletid, size, slots)
    QBCore.Functions.Progressbar("open_wallet", "Opening Wallet", 1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("inventory:server:OpenInventory", "stash", walletid, {
            maxweight = size,
            slots = slots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", walletid)
    end)
end)

RegisterNetEvent("lb-wallet:client:openStore", function()
    local OpenMenu = {
        {
            header = "Wallet Store",
            isMenuHeader = true
        }, {
            header = "Buy Leather Wallet",
            txt = "Price: $"..Config.Wallets["wallet"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["wallet"].price,
                    item = "wallet",
                }
            }
        },
        {
            header = "Buy Louis Vuitton Wallet Wallet",
            txt = "Price: $"..Config.Wallets["lvwallet"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["lvwallet"].price,
                    item = "lvwallet",
                }
            }
        },
        {
            header = "Buy Gucci Wallet",
            txt = "Price: $"..Config.Wallets["gucciwallet"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["gucciwallet"].price,
                    item = "gucciwallet",
                }
            }
        },
        {
            header = "Buy Kate Spade Clutch",
            txt = "Price: $"..Config.Wallets["spadeclutch"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["spadeclutch"].price,
                    item = "spadeclutch",
                }
            }
        },
        {
            header = "Buy Kate Spade Purse",
            txt = "Price: $"..Config.Wallets["spadepurse"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["spadepurse"].price,
                    item = "spadepurse",
                }
            }
        },
        {
            header = "Buy Louis Vuitton Clutch",
            txt = "Price: $"..Config.Wallets["lvclutch"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["lvclutch"].price,
                    item = "lvclutch",
                }
            }
        },
        {
            header = "Buy Louis Vuitton Purse",
            txt = "Price: $"..Config.Wallets["lvpurse"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["lvpurse"].price,
                    item = "lvpurse",
                }
            }
        },
        {
            header = "Buy Gucci Clutch",
            txt = "Price: $"..Config.Wallets["gucciclutch"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["gucciclutch"].price,
                    item = "gucciclutch",
                }
            }
        },
        {
            header = "Buy Gucci Purse",
            txt = "Price: $"..Config.Wallets["guccipurse"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["guccipurse"].price,
                    item = "guccipurse",
                }
            }
        },
        {
            header = "Buy Chanel Clutch",
            txt = "Price: $"..Config.Wallets["chanelclutch"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["chanelclutch"].price,
                    item = "chanelclutch",
                }
            }
        },
        {
            header = "Buy Chanel Purse",
            txt = "Price: $"..Config.Wallets["chanelpurse"].price,
            params = {
                isServer = true,
                event = "lb-wallet:server:buyWallet",
                args = {
                    price = Config.Wallets["chanelpurse"].price,
                    item = "chanelpurse",
                }
            }
        },
    }
    exports['qb-menu']:openMenu(OpenMenu)
end)
local spawnedEntity = nil

local function SpawnPed()
    RequestModel(Config.BuyModel)
    while not HasModelLoaded(Config.BuyModel) do
        Wait(0)
    end
    local entity = CreatePed(0, GetHashKey(Config.BuyModel), Config.BuyLocation.x, Config.BuyLocation.y, Config.BuyLocation.z - 1.0, Config.BuyLocation.w,  false, false)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)
    exports['qb-target']:AddTargetEntity(entity, { 
    options = { 
    { 
        type = "client", 
        event = "lb-wallet:client:openStore",
        icon = 'fas fa-circle',
        label = 'Store',
        }
    },
        distance = 2.5, 
    })
    return entity
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local pos = GetEntityCoords(PlayerPedId())
        if #(pos - vector3(Config.BuyLocation.x, Config.BuyLocation.y, Config.BuyLocation.z)) < 50.0 then
            if spawnedEntity == nil or not DoesEntityExist(spawnedEntity) then
                spawnedEntity = SpawnPed()
            end
        else
            if spawnedEntity ~= nil and DoesEntityExist(spawnedEntity) then
                DeleteEntity(spawnedEntity)
            end
        end
    end
end)