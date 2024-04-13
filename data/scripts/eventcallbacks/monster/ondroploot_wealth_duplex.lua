local callback = EventCallback()

function callback.monsterOnDropLoot(monster, corpse)
	local player = Player(corpse:getCorpseOwner())
	if not player or not player:canReceiveLoot() then
		return
	end
	local mType = monster:getType()
	if not mType then
		return
	end

	local factor = 1.0
	local msgSuffix = ""
	local participants = { player }
	if configManager.getBoolean(configKeys.PARTY_SHARE_LOOT_BOOSTS) then
		local party = player:getParty()
		if party and party:isSharedExperienceEnabled() then
			participants = party:getMembers()
			table.insert(participants, party:getLeader())
		end
	end

	local wealthDuplex = Concoction.find(Concoction.Ids.WealthDuplex)
	if not wealthDuplex then
		logger.debug("[Monster:onDropLoot] - Could not find WealthDuplex concoction.")
		return
	end
	local chance = 0
	local wealthActivators = {}
	for _, participant in ipairs(participants) do
		if participant and wealthDuplex:active(participant) then
			chance = chance + wealthDuplex.config.rate
			table.insert(wealthActivators, participant:getName())
		end
	end

	if #wealthActivators > 0 then
		local numActivators = #wealthActivators
		chance = chance / numActivators ^ configManager.getFloat(configKeys.PARTY_SHARE_LOOT_BOOSTS_DIMINISHING_FACTOR)
	end

	local chanceRoll = math.random(1, 100)
	local rolls = 1
	
	if chanceRoll == 15 then	
		rolls = math.random(1,3)
	end

	if configManager.getBoolean(configKeys.PARTY_SHARE_LOOT_BOOSTS) and rolls > 1 then
		msgSuffix = msgSuffix .. " (active wealth duplex, " .. rolls .. " extra rolls)"
	else
		msgSuffix = msgSuffix .. " (active wealth duplex)"
	end

	local lootTable = {}
	for _ = 1, rolls do
		lootTable = mType:generateLootRoll({ factor = factor, gut = false }, lootTable)
	end
	corpse:addLoot(lootTable)

	local existingSuffix = corpse:getAttribute(ITEM_ATTRIBUTE_LOOTMESSAGE_SUFFIX) or ""
	corpse:setAttribute(ITEM_ATTRIBUTE_LOOTMESSAGE_SUFFIX, existingSuffix .. msgSuffix)
end

callback:register()