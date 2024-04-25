local internalNpcName = "Bag Seller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130,
	lookHead = 20,
	lookBody = 75,
	lookLegs = 88,
	lookFeet = 39,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.currency = 39039

npcConfig.shop = {
	{ itemName = "Primal bag", clientId = 39546, buy = 2 },
	{ itemName = "Bag you desire", clientId = 34109, buy = 2 },
	{ itemName = "Soulcutter", clientId = 34082, sell = 1 },
	{ itemName = "Soulshredder", clientId = 34083, sell = 1 },
	{ itemName = "Soulbiter", clientId = 34084, sell = 1 },
	{ itemName = "Souleater", clientId = 34085, sell = 1 },
	{ itemName = "Soulcrusher", clientId = 34086, sell = 1 },
	{ itemName = "Soulmaimer", clientId = 34087, sell = 1 },
	{ itemName = "Pair of Soulwalkers", clientId = 34097, sell = 1 },
	{ itemName = "Soulbastion", clientId = 34099, sell = 1 },
	{ itemName = "Soulbleeder", clientId = 34088, sell = 1 },
	{ itemName = "Soulpiercer", clientId = 34089, sell = 1 },
	{ itemName = "Soulshell", clientId = 34094, sell = 1 },
	{ itemName = "Pair of Soulstalkers", clientId = 34098, sell = 1 },
	{ itemName = "Soultainter", clientId = 34090, sell = 1 },
	{ itemName = "Soulshanks", clientId = 34092, sell = 1 },
	{ itemName = "Soulmantle", clientId = 34095, sell = 1 },
	{ itemName = "Soulhexer", clientId = 34091, sell = 1 },
	{ itemName = "Soulstrider", clientId = 34093, sell = 1 },
	{ itemName = "Soulshroud", clientId = 34096, sell = 1 },
	{ itemName = "Spiritthorn Armor", clientId = 39147, sell = 1 },
	{ itemName = "Spiritthorn Helmet", clientId = 39148, sell = 1 },
	{ itemName = "Charged Spiritthorn Ring", clientId = 39177, sell = 1 },
	{ itemName = "Alicorn Headguard", clientId = 39149, sell = 1 },
	{ itemName = "Alicorn Quiver", clientId = 39150, sell = 1 },
	{ itemName = "Charged Alicorn Ring", clientId = 39180, sell = 1 },
	{ itemName = "Arcanomancer Regalia", clientId = 39151, sell = 1 },
	{ itemName = "Arcanomancer Folio", clientId = 39152, sell = 1 },
	{ itemName = "Charged Arcanomancer Sigil", clientId = 39183, sell = 1 },
	{ itemName = "Arboreal Crown", clientId = 39153, sell = 1 },
	{ itemName = "Arboreal Tome", clientId = 39154, sell = 1 },
	{ itemName = "Charged Arboreal Ring", clientId = 39186, sell = 1 }

}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_LOOK, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Trading tokens! First-class bargains!" },
	{ text = "Bespoke armor for all vocations! For the cost of some tokens only!" },
	{ text = "Tokens! Bring your tokens!" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local charge = {}

local chargeItem = {
}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if not player or not playerId then
		return false
	end

	if MsgContains(message, "token") or MsgContains(message, "tokens") then
		npcHandler:say("If you have any {silver} tokens with you, let's have a look! Maybe I can offer you something in exchange.", npc, creature)
	elseif MsgContains(message, "information") then
		npcHandler:say("With pleasure. <bows> I trade {token}s. There are several ways to obtain the {token}s I am interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items.", npc, creature)
	elseif MsgContains(message, "talk") then
		npcHandler:say({ "Why, certainly! I'm always up for some small talk. ...", "The weather continues just fine here, don't you think? Just the day for a little walk around the town! ...", "Actually, I haven't been around much yet, but I'm looking forward to exploring the city once I've finished trading {token}s." }, npc, creature)
	elseif MsgContains(message, "silver") then
		npc:openShopWindow(creature)
		npcHandler:say({ "Here's the deal, " .. player:getName() .. ". For 100 of your silver tokens, I can offer you some first-class torso armor. These armors provide a solid boost to your main attack skill, as well as ...", "some elemental protection of your choice! I also sell a magic shield potion for one silver token. So these are my offers." }, npc, creature)
	elseif MsgContains(message, "enchant") then
		npcHandler:say({ "The following items can be enchanted: {pendulet}, {sleep shawl}, {blister ring}, {theurgic amulet}, {ring of souls}. ...", "For sufficient silver tokens you can also enchant: {spiritthorn ring}, {alicorn ring}, {arcanomancer sigil}, {arboreal ring}, {turtle amulet}. Make you choice!" }, npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif table.contains({ "pendulet", "sleep shawl", "blister ring", "theurgic amulet", "ring of souls", "turtle amulet" }, message:lower()) and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("Should I enchant the item " .. message .. " for 2 " .. ItemType(npc:getCurrency()):getPluralName():lower() .. "?", npc, creature)
		charge = message:lower()
		npcHandler:setTopic(playerId, 2)
	elseif table.contains({ "spiritthorn ring", "alicorn ring", "arcanomancer sigil", "arboreal ring" }, message:lower()) and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("Should I enchant the item " .. message .. " for 5 " .. ItemType(npc:getCurrency()):getPluralName():lower() .. "?", npc, creature)
		charge = message:lower()
		npcHandler:setTopic(playerId, 2)
	elseif npcHandler:getTopic(playerId) == 2 then
		if MsgContains(message, "yes") then
			if not chargeItem[charge] then
				npcHandler:say("Sorry, you don't have an unenchanted " .. charge .. ".", npc, creature)
			else
				if (player:getItemCount(npc:getCurrency()) >= 2) and (player:getItemCount(chargeItem[charge].noChargeID) >= 1) then
					player:removeItem(npc:getCurrency(), 2)
					player:removeItem(chargeItem[charge].noChargeID, 1)
					local itemAdd = player:addItem(chargeItem[charge].ChargeID, 1)
					npcHandler:say("Ah, excellent. Here is your " .. itemAdd:getName():lower() .. ".", npc, creature)
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough " .. ItemType(npc:getCurrency()):getPluralName():lower() .. " and it's a deal.", npc, creature)
				end
				npcHandler:setTopic(playerId, 0)
			end
		elseif MsgContains(message, "no") then
			npcHandler:say("Alright, come back if you have changed your mind.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	elseif MsgContains(message, "addon") then
		if player:hasOutfit(846, 0) or player:hasOutfit(845, 0) then
			npcHandler:say("Ah, very good. Now choose your addon: {first} or {second}.", npc, creature)
			npcHandler:setTopic(playerId, 3)
		else
			npcHandler:say("Sorry, friend, but one good turn deserves another. You need to obtain the rift warrior outfit first.", npc, creature)
		end
	elseif table.contains({ "first", "second" }, message:lower()) and npcHandler:getTopic(playerId) == 3 then
		if message:lower() == "first" then
			if not (player:hasOutfit(846, 1)) and not (player:hasOutfit(845, 1)) then
				if player:removeItem(22516, 100) then
					npcHandler:say("Ah, excellent. Obtain the first addon for your rift warrior outfit.", npc, creature)
					player:addOutfitAddon(846, 1)
					player:addOutfitAddon(845, 1)
					if (player:hasOutfit(846, 1) or player:hasOutfit(845, 1)) and (player:hasOutfit(846, 2) or player:hasOutfit(845, 2)) then
						player:addAchievement("Rift Warrior")
					end
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough " .. ItemType(npc:getCurrency()):getPluralName():lower() .. " and it's a deal.", npc, creature)
				end
			else
				npcHandler:say("Sorry, friend, you already have the first Rift Warrior addon.", npc, creature)
			end
		elseif message:lower() == "second" then
			if not (player:hasOutfit(846, 2)) and not (player:hasOutfit(845, 2)) then
				if player:removeItem(22516, 100) then
					npcHandler:say("Ah, excellent. Obtain the second addon for your rift warrior outfit.", npc, creature)
					player:addOutfitAddon(846, 2)
					player:addOutfitAddon(845, 2)
					if (player:hasOutfit(846, 1) or player:hasOutfit(845, 1)) and (player:hasOutfit(846, 2) or player:hasOutfit(845, 2)) then
						player:addAchievement("Rift Warrior")
					end
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough " .. ItemType(npc:getCurrency()):getPluralName():lower() .. " and it's a deal.", npc, creature)
				end
			else
				npcHandler:say("Sorry, friend, you already have the second Rift Warrior addon.", npc, creature)
			end
		end
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Blessings, Player! How may I be of service? Do you wish to trade some {token}s, or would you like some {information} or {talk}? Should I {enchant} certain items for you?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)