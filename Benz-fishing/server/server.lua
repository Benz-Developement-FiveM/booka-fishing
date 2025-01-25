local QBCore = exports['qb-core']:GetCoreObject()
--============================================================================ Items

QBCore.Functions.CreateUseableItem("anchor", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent('fishing:client:anchor', source)
    end
end)

QBCore.Functions.CreateUseableItem("fishingrod", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
 		TriggerClientEvent('fishing:fishstart', source)
    end
end)

QBCore.Functions.CreateUseableItem("fishicebox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent('fishing:client:useFishingBox', source, item.info.boxid)  
    end
end)

QBCore.Functions.CreateUseableItem("fishinglootbig", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent("fishing:client:attemptTreasureChest", src)
    end
end)

QBCore.Functions.CreateUseableItem("fishingloot", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		Player.Functions.RemoveItem("fishingloot", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingloot'], "remove", 1)
		TriggerClientEvent('QBCore:Notify', src, "Opening Box", "primary")
		SetTimeout(1000, function()
			Player.Functions.AddItem('fishingkey', 1, nil, {["quality"] = 100}) 
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingkey'], "add", 1)

			Player.Functions.AddItem(Config.smallLootboxReward, 1, nil, {["quality"] = 100}) 
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.smallLootboxReward], "add", 1)

			Player.Functions.AddMoney('cash', Config.smallLootboxCash, "fishingloot")
			TriggerClientEvent('QBCore:Notify', src, "You found a couple items and $"..Config.smallLootboxCash, "success")
		end)
    end
end)

QBCore.Functions.CreateUseableItem("fishtacklebox", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then

		TriggerClientEvent('QBCore:Notify', src, "Opening Tackel Box", "success")
		Player.Functions.RemoveItem("fishtacklebox", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishtacklebox'], "remove", 1)

		SetTimeout(1250, function()
			Player.Functions.AddItem('pearlscard', 1, nil, {["quality"] = 100}) 
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pearlscard'], "add", 1)
		end)
    end
end)

--============================================================================ Events

RegisterNetEvent('fishing:server:removeFishingBait', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('fishbait', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishbait'], "remove", 1)
end)

RegisterNetEvent("fishing:server:addTackleBox", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('QBCore:Notify', src, "There seems to tackle box left over from another fisherman", "primary")
	SetTimeout(1000, function()
		Player.Functions.AddItem('fishtacklebox', 1, nil, {["quality"] = 100}) 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishtacklebox'], "add", 1)
	end)
end) 

RegisterNetEvent("fishing:server:returnDeposit", function()
	local src = source
    local pData = QBCore.Functions.GetPlayer(src)
	local price = math.floor(Config.BoatPrice/2)
	pData.Functions.AddMoney('bank', price , "boat-rental")
	TriggerClientEvent('QBCore:Notify', src, "Boat has been returned for $"..price, "success")
end) 

RegisterNetEvent('fishing:server:catch', function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 100)
    local itemFound = true
    local itemCount = 1

    if itemFound then
        for i = 1, itemCount, 1 do
            if luck == 100 then
				local weight = math.random(850,1000)
				local info = {species = "Orca",lbs = weight,type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 1)
				Player.Functions.AddItem('killerwhale', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['killerwhale'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a killer whale!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 95 and luck <= 100 then
				Player.Functions.AddItem('fishinglootbig', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishinglootbig'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You found a Treasure Chest!", "success")
			elseif luck >= 90 and luck <= 95 then
				local weight = math.random(10,28)
				local info = {species = "Bottlenose",lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 2)
				Player.Functions.AddItem('dolphin', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dolphin'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a dolphin!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 85 and luck <= 90 then
				local weight = math.random(20,30)
				local info = {species = "Hammerhead Shark", lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 3)
				Player.Functions.AddItem('sharkhammer', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sharkhammer'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a hammerhead shark!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 80 and luck <= 85 then
				local weight = math.random(1,6)
				local info = {species = "Tiger Shark", lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 4)
				Player.Functions.AddItem('sharktiger', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sharktiger'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a tiger shark!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,9)
				local info = {species = "Manta ray", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('stingray', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stingray'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a "..weight.."lbs Stingray!", "success")
			elseif luck >= 70 and luck <= 75 then
				local weight = math.random(10,15)
				local info = {species = "Flounder", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('flounder', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['flounder'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a " .. weight .. "lbs Flounder", "success")
			elseif luck >= 65 and luck <= 70 then
				Player.Functions.AddItem('fishingboot', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingboot'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a fishing boot!", "primary")
			elseif luck >= 60 and luck <= 65 then
				local weight = math.random(1,6)
				local info = {species = "Bass", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('bass', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bass'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a " .. weight .. "lbs Bass", "success")
			elseif luck >= 55 and luck <= 60 then
				Player.Functions.AddItem('fishingloot', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingloot'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You found a small box!", "success")
			elseif luck >= 50 and luck <= 55 then
				local weight = math.random(5,7)
				local info = {species = "Cod", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('codfish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['codfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a " .. weight .. "lbs  Cod", "success")
			elseif luck >= 45 and luck <= 50 then
				Player.Functions.AddItem('fishingtin', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingtin'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a fishing tin!", "primary")
			elseif luck >= 0 and luck <= 45 then
				local weight = math.random(1,5)
				local info = {species = "Mackerel", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('mackerel', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mackerel'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a " .. weight .. "lbs Mackerel", "success")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,9)
				local info = {species = "bluegill", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('bluegill', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bluegill'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a bluegill"..weight.."lbs bluegill!", "success")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,9)
				local info = {species = "butterflyfish", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('butterflyfish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['butterflyfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a butterflyfish"..weight.."lbs butterflyfish!", "success")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,9)
				local info = {species = "clownfish", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('clownfish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['clownfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a clownfish"..weight.."lbs clownfish!", "success")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,14)
				local info = {species = "Northern_Pike", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('Northern_Pike', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['Northern_Pike'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a Northern Pike"..weight.."lbs Northern Pike!", "success")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,9)
				local info = {species = "oceanfish", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('oceanfish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['oceanfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a oceanfish"..weight.."lbs oceanfish!", "success")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,9)
				local info = {species = "parrotfish", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('parrotfish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['parrotfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a parrotfish"..weight.."lbs parrotfish!", "success")
			elseif luck >= 80 and luck <= 85 then
				local weight = math.random(1,6)
				local info = {species = "seahorse", lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 4)
				Player.Functions.AddItem('seahorse', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['seahorse'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a seahorse!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 80 and luck <= 85 then
				local weight = math.random(25,60)
				local info = {species = "seaturtle", lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 4)
				Player.Functions.AddItem('seaturtle', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['seaturtle'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a seaturtle!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 90 and luck <= 95 then
				local weight = math.random(10,28)
				local info = {species = "catfish",lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 2)
				Player.Functions.AddItem('catfish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['catfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a catfish!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 85 and luck <= 90 then
				local weight = math.random(20,30)
				local info = {species = "catfish", lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 3)
				Player.Functions.AddItem('catfish2', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['catfish2'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a catfish shark!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 80 and luck <= 85 then
				local weight = math.random(1,6)
				local info = {species = "whale", lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 4)
				Player.Functions.AddItem('whale', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['whale'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a whale!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 80 and luck <= 85 then
				local weight = math.random(1,6)
				local info = {species = "whale", lbs = weight, type = "Exotic"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 4)
				Player.Functions.AddItem('whale2', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['whale2'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a whale!\nThese are endangered species and are illegal to possess", "primary")
			elseif luck >= 75 and luck <= 80 then
				local weight = math.random(4,9)
				local info = {species = "fish", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 5)
				Player.Functions.AddItem('fish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a fish"..weight.."lbs fish!", "success")
			elseif luck >= 70 and luck <= 75 then
				local weight = math.random(10,15)
				local info = {species = "fish", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('fish2', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fish2'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a fish" .. weight .. "lbs fish", "success")
			elseif luck >= 65 and luck <= 70 then
				Player.Functions.AddItem('goldfish', 1, nil, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['goldfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a goldfish!" .. weight .. "lbs goldfish", "success")
			elseif luck >= 60 and luck <= 65 then
				local weight = math.random(1,6)
				local info = {species = "largemouthbass", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('largemouthbass', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['largemouthbass'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a largemouthbass" .. weight .. "lbs largemouthbass", "success")
			elseif luck >= 60 and luck <= 65 then
				local weight = math.random(1,6)
				local info = {species = "redfish", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('redfish', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['redfish'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a redfish" .. weight .. "lbs redfish", "success")
			elseif luck >= 60 and luck <= 65 then
				local weight = math.random(1,6)
				local info = {species = "salmon", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('salmon', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['salmon'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a salmon" .. weight .. "lbs salmon", "success")
			elseif luck >= 60 and luck <= 65 then
				local weight = math.random(1,6)
				local info = {species = "stripedbass", lbs = weight, type = "Normal"}
				--TriggerClientEvent('fishing:client:spawnFish', src, 6)
				Player.Functions.AddItem('stripedbass', 1, nil, info, {["quality"] = 100})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stripedbass'], "add", 1)
				TriggerClientEvent('QBCore:Notify', src, "You caught a stripedbass" .. weight .. "lbs stripedbass", "success")
            end
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent('fishing:server:SellillegalFish', function(args)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		local dolphin = Player.Functions.GetItemByName("dolphin")
		if dolphin ~= nil then
			local payment = Config.dolphinPrice
			Player.Functions.RemoveItem("dolphin", 1, k)
			Player.Functions.AddMoney('bank', payment , "dolphin-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['dolphin'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Dolphin Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Dolphin to sell", 'error')
		end
	elseif args == 2 then 
		local sharktiger = Player.Functions.GetItemByName("sharktiger")
		if sharktiger ~= nil then
			local payment = Config.sharktigerPrice
			Player.Functions.RemoveItem("sharktiger", 1, k)
			Player.Functions.AddMoney('bank', payment , "sharktiger-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sharktiger'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Tiger Shark Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Tiger Shark to sell", 'error')
		end
	elseif args == 3 then 
		local sharkhammer = Player.Functions.GetItemByName("sharkhammer")
		if sharkhammer ~= nil then
			local payment = Config.sharkhammerPrice
			Player.Functions.RemoveItem("sharkhammer", 1, k)
			Player.Functions.AddMoney('bank', payment , "sharkhammer-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sharkhammer'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Hammerhead Shark Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Hammerhead Shark to sell", 'error')
		end
	elseif args == 4 then 
		local killerwhale = Player.Functions.GetItemByName("killerwhale")
		if killerwhale ~= nil then
			local payment = Config.killerwhalePrice
			Player.Functions.RemoveItem("killerwhale", 1, k)
			Player.Functions.AddMoney('bank', payment , "killerwhale-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['killerwhale'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "Killer Whale Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Killer Whale to sell", "error")
		end
	elseif args == 5 then 
		local seahorse = Player.Functions.GetItemByName("seahorse")
		if seahorse ~= nil then
			local payment = Config.seahorsePrice
			Player.Functions.RemoveItem("seahorse", 1, k)
			Player.Functions.AddMoney('bank', payment , "seahorse-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['seahorse'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "seahorse Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any seahorses to sell", 'error')
		end
	elseif args == 6 then 
		local catfish = Player.Functions.GetItemByName("catfish")
		if catfish ~= nil then
			local payment = Config.catfishPrice
			Player.Functions.RemoveItem("catfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "catfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['catfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "catfish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any catfish to sell", 'error')
		end
	elseif args == 7 then 
		local catfish2 = Player.Functions.GetItemByName("catfish2")
		if catfish2 ~= nil then
			local payment = Config.catfish2Price
			Player.Functions.RemoveItem("catfish2", 1, k)
			Player.Functions.AddMoney('bank', payment , "catfish2-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['catfish2'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "catfish Shark Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any catfish Sharks to sell", 'error')
		end
	elseif args == 8 then 
		local whale = Player.Functions.GetItemByName("whale")
		if whale ~= nil then
			local payment = Config.whalePrice
			Player.Functions.RemoveItem("whale", 1, k)
			Player.Functions.AddMoney('bank', payment , "whale-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['whale'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "whale Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any whales to sell", "error")
		end
	elseif args == 9 then 
		local whale2 = Player.Functions.GetItemByName("whale2")
		if whale2 ~= nil then
			local payment = Config.whale2Price
			Player.Functions.RemoveItem("whale2", 1, k)
			Player.Functions.AddMoney('bank', payment , "whale2-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['whale2'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "whale Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any whales to sell", 'error')
		end

	else 
		local seaturtle = Player.Functions.GetItemByName("seaturtle")
		if seaturtle ~= nil then
			local payment = Config.seaturtlePrice
			Player.Functions.RemoveItem("seaturtle", 1, k)
			Player.Functions.AddMoney('bank', payment , "seaturtle-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['seaturtle'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "seaturtle Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellillegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any seaturtles to sell", 'error')
		end
	end
end)

RegisterNetEvent('fishing:server:SellLegalFish', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		local mackerel = Player.Functions.GetItemByName("mackerel")
		if mackerel ~= nil then
			local payment = Config.mackerelPrice
			Player.Functions.RemoveItem("mackerel", 1, k)
			Player.Functions.AddMoney('bank', payment , "mackerel-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mackerel'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Mackerel Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Mackerels to sell", "error")
		end
	elseif args == 2 then
		local codfish = Player.Functions.GetItemByName("codfish")
		if codfish ~= nil then
			local payment = Config.codfishPrice
			Player.Functions.RemoveItem("codfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "codfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['codfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Cod Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Cods to sell", "error")
		end
	elseif args == 3 then
		local bass = Player.Functions.GetItemByName("bass") 
		if bass ~= nil then
			local payment = Config.bassPrice
			Player.Functions.RemoveItem("bass", 1, k)
			Player.Functions.AddMoney('bank', payment , "bass-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bass'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Bass Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Bass to sell", "error")
		end
	elseif args == 4 then
		local flounder = Player.Functions.GetItemByName("flounder")
		if flounder ~= nil then
			local payment = Config.flounderPrice
			Player.Functions.RemoveItem("flounder", 1, k)
			Player.Functions.AddMoney('bank', payment , "flounder-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flounder'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Flounder Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Flounders to sell", "error")
		end
	elseif args == 5 then
		local stingray = Player.Functions.GetItemByName("stingray")
		if stingray ~= nil then
			local payment = Config.stingrayPrice
			Player.Functions.RemoveItem("stingray", 1, k)
			Player.Functions.AddMoney('bank', payment , "stingray-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Stingray Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any Stingray to sell", "error")
		end	
	elseif args == 6 then 
		local bluegill = Player.Functions.GetItemByName("bluegill")
		if bluegill ~= nil then
			local payment = Config.bluegillPrice
			Player.Functions.RemoveItem("bluegill", 1, k)
			Player.Functions.AddMoney('bank', payment , "bluegill-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bluegill'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 bluegill Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any bluegills to sell", "error")
		end
	elseif args == 7 then
		local butterflyfish = Player.Functions.GetItemByName("butterflyfish")
		if butterflyfish ~= nil then
			local payment = Config.butterflyfishPrice
			Player.Functions.RemoveItem("butterflyfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "butterflyfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['butterflyfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 butterflyfish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any butterflyfish to sell", "error")
		end
	elseif args == 8 then
		local clownfish = Player.Functions.GetItemByName("clownfish") 
		if clownfish ~= nil then
			local payment = Config.clownfishPrice
			Player.Functions.RemoveItem("clownfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "clownfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['clownfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 clownfish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any clownfish to sell", "error")
		end
	elseif args == 9 then
		local Northern_Pike = Player.Functions.GetItemByName("Northern_Pike")
		if Northern_Pike ~= nil then
			local payment = Config.Northern_PikePrice
			Player.Functions.RemoveItem("Northern_Pike", 1, k)
			Player.Functions.AddMoney('bank', payment , "Northern_Pike-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['Northern_Pike'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 Northern Pike Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any Northern Pikes to sell", "error")
		end
	elseif args == 10 then
		local oceanfish = Player.Functions.GetItemByName("oceanfish")
		if oceanfish ~= nil then
			local payment = Config.oceanfishPrice
			Player.Functions.RemoveItem("oceanfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "oceanfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['oceanfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 oceanfish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any oceanfish to sell", "error")
		end
	elseif args == 11 then
		local fish = Player.Functions.GetItemByName("fish")
		if fish ~= nil then
			local payment = Config.fishPrice
			Player.Functions.RemoveItem("fish", 1, k)
			Player.Functions.AddMoney('bank', payment , "fish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['fish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 fish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any fish to sell", "error")
		end
	elseif args == 12 then
		local fish2 = Player.Functions.GetItemByName("fish2") 
		if fish2 ~= nil then
			local payment = Config.fish2Price
			Player.Functions.RemoveItem("fish2", 1, k)
			Player.Functions.AddMoney('bank', payment , "fish2-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['fish2'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 fish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any fish to sell", "error")
		end
	elseif args == 13 then
		local goldfish = Player.Functions.GetItemByName("goldfish")
		if goldfish ~= nil then
			local payment = Config.goldfishPrice
			Player.Functions.RemoveItem("goldfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "goldfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['goldfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 goldfish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any goldfish to sell", "error")
		end
	elseif args == 14 then
		local largemouthbass = Player.Functions.GetItemByName("largemouthbass")
		if largemouthbass ~= nil then
			local payment = Config.largemouthbassPrice
			Player.Functions.RemoveItem("largemouthbass", 1, k)
			Player.Functions.AddMoney('bank', payment , "largemouthbass-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['largemouthbass'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 largemouthbass Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "You dont have any largemouthbass to sell", "error")
		end	
	elseif args == 15 then 
		local redfish = Player.Functions.GetItemByName("redfish")
		if redfish ~= nil then
			local payment = Config.redfishPrice
			Player.Functions.RemoveItem("redfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "redfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['redfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 redfish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any redfish to sell", "error")
		end
	elseif args == 16 then
		local salmon = Player.Functions.GetItemByName("salmon")
		if salmon ~= nil then
			local payment = Config.salmonPrice
			Player.Functions.RemoveItem("salmon", 1, k)
			Player.Functions.AddMoney('bank', payment , "salmon-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['salmon'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 salmon Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any salmon to sell", "error")
		end
	elseif args == 17 then
		local stripedbass = Player.Functions.GetItemByName("stripedbass")
		if stripedbass ~= nil then
			local payment = Config.stripedbassPrice
			Player.Functions.RemoveItem("stripedbass", 1, k)
			Player.Functions.AddMoney('bank', payment , "stripedbass-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stripedbass'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 stripedbass Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any stripedbass to sell", "error")
		end
	else
		local parrotfish = Player.Functions.GetItemByName("parrotfish")
		if parrotfish ~= nil then
			local payment = Config.parrotfishPrice
			Player.Functions.RemoveItem("parrotfish", 1, k)
			Player.Functions.AddMoney('bank', payment , "parrotfish-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['parrotfish'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 parrotfish Sold for $"..payment, "success")
			TriggerClientEvent("bookafishing:client:SellLegalFish", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have any parrotfish to sell", "error")
		end		
	end
end)

RegisterNetEvent('fishing:server:BuyFishingGear', function(args)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	local bankBalance = Player.PlayerData.money["bank"]

	if args == 1 then 
		if bankBalance >= Config.fishingBaitPrice then
			Player.Functions.RemoveMoney('bank', Config.fishingBaitPrice, "fishbait")
			Player.Functions.AddItem('fishbait', 1, nil, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishbait'], "add", 1)
			TriggerClientEvent("bookafishing:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	elseif args == 2 then 
		if bankBalance >= Config.fishingRodPrice then
			Player.Functions.RemoveMoney('bank', Config.fishingRodPrice, "fishingrod")
			Player.Functions.AddItem('fishingrod', 1, nil, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingrod'], "add", 1)
			TriggerClientEvent("bookafishing:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	elseif args == 3 then 
		if bankBalance >= Config.BoatAnchorPrice then
			Player.Functions.RemoveMoney('bank', Config.BoatAnchorPrice, "anchor")
			Player.Functions.AddItem('anchor', 1, nil, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['anchor'], "add", 1)
			TriggerClientEvent("bookafishing:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	else
		if bankBalance >= Config.BoatAnchorPrice then
			Player.Functions.RemoveMoney('bank', Config.BoatAnchorPrice, "fishicebox")
			local info = {
				boxid = math.random(111,999),
				boxOwner = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
			}
			Player.Functions.AddItem('fishicebox', 1, nil, info, {["quality"] = 100})
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishicebox'], "add", 1)
			TriggerClientEvent("bookafishing:client:buyFishingGear", source)
		else
			TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
		end
	end
end)


--============================================================================ Callbacks
QBCore.Functions.CreateCallback('fishing:server:checkMoney', function(source, cb)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local bankBalance = pData.PlayerData.money["bank"]
	local price = Config.BoatPrice
    if bankBalance >= price then
        pData.Functions.RemoveMoney('bank', Config.BoatPrice, "boat-rental")
		TriggerClientEvent('QBCore:Notify', src, "Boat has been rented for $"..price, "success")
        cb(true)
    else
        TriggerClientEvent('QBCore:Notify', src, "You dont have enough money..", "error")
        cb(false)
    end
end)
