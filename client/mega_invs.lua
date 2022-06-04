-- LOOTBOXES

RegisterNetEvent('vorp_inventory:OpenLootboxInventory')
AddEventHandler('vorp_inventory:OpenLootboxInventory', function (name, id)
    SetNuiFocus(true, true)
    SendNuiMessage(json.encode({
        action = "display",
        type = "Lootbox",
        title = name,
        LootboxId = id
    }))
end)

RegisterNetEvent('vorp_inventory:ReloadLootboxInventory')
AddEventHandler('vorp_inventory:ReloadLootboxInventory', function (inv)
    TriggerEvent('vorp_inventory:ReloadContainerInventory', inv)
end)

RegisterNUICallback('TakeFromLootbox', function (data, cb)
    print('takefromlootbox', json.encode(data))
    TriggerServerEvent('mega_lootboxes:TakeFromContainer', json.encode(data))
end)

RegisterNUICallback('MoveToLootbox', function (data, cb)
    TriggerServerEvent('mega_lootboxes:MoveToContainer', json.encode(data))
end)

-- DEPOSITS

RegisterNetEvent('vorp_inventory:OpenDepositInventory')
AddEventHandler('vorp_inventory:OpenDepositInventory', function (name, id)
    SetNuiFocus(true, true)
    SendNuiMessage(json.encode({
        action = "display",
        type = "Deposit",
        title = name,
        DepositId = id
    }))
end)

RegisterNetEvent('vorp_inventory:ReloadDepositInventory')
AddEventHandler('vorp_inventory:ReloadDepositInventory', function (inv)
    TriggerEvent('vorp_inventory:ReloadContainerInventory', inv)
end)

RegisterNUICallback('TakeFromDeposit', function (data, cb)
    TriggerServerEvent('mega_companies:TakeFromContainer', json.encode(data))
end)

RegisterNUICallback('MoveToDeposit', function (data, cb)
    TriggerServerEvent('mega_companies:MoveToContainer', json.encode(data))
end)

-- UTILS

RegisterCommand('unfocus', function ()
    SetNuiFocus(false, false)
end)