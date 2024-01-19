local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterServerEvent('qb-largewarehouse:server:getItemFour', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  for _ = 1, math.random(1, Config.CarMaxItemsReceived), 1 do
    local randItem = Config.CarItemTable[math.random(1, #Config.CarItemTable)]
    local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
    Player.Functions.AddItem(randItem, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
    Wait(500)
  end

  local chance = math.random(1, 100)
  if chance < 7 then
    Player.Functions.AddItem(Config.MediumChanceItem, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.CarChanceItem], 'add')
  end

  local luck = math.random(1, 10)
  local odd = math.random(1, 10)
  if luck == odd then
    local random = math.random(1, 3)
    Player.Functions.AddItem(Config.MediumLuckyItem, random)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.CarLuckyItem], 'add')
  end
end)
