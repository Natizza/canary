local config = {
    uniqueId = 30000, -- on lever

    lever = {
        left = 2772,
        right = 2773
    },

    playItem = {
        itemId = 37317,
        count = 1
    },

    rouletteOptions = {
        ignoredItems = {}, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
        effectDelay = 333,
        spinTime = {min = 8, max = 12}, -- seconds
        spinSlowdownRamping = 5,
        rouletteStorage = "roulette-finishes" -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },

    prizePool = {
        {itemId = 37317, count = {1, 1},   chance = 51}, -- roulete coin
        {itemId = 44797, count = {1, 1},   chance = 50}, -- ED BP 
        {itemId = 44798, count = {1, 1},  chance = 49}, --  MS BP
        {itemId = 44800, count = {1, 1},  chance = 48}, --  RP BP
        {itemId = 44799, count = {1, 1},   chance = 47}, -- EK BP
        {itemId = 44808, count = {1, 1},   chance = 46}, -- EK BOX
        {itemId = 44810, count = {1, 1},   chance = 45}, -- ED BOX
        {itemId = 44809, count = {1, 1},   chance = 44}, -- MS BOX
        {itemId = 44807, count = {1, 1},   chance = 43}, -- RP BOX
        {itemId = 14758, count = {1, 1},   chance = 42}, -- vip scroll 7 days
        {itemId = 37317, count = {1, 1},   chance = 41}, -- roulete coin
        {itemId = 9596, count = {1, 1},   chance = 40}, -- tool pink
        {itemId = 9598, count = {1, 1},   chance = 39}, -- tool blue
        {itemId = 9594, count = {1, 1},   chance = 38}, -- tool red
        {itemId = 44796, count = {1, 1},   chance = 37}, -- death bp
        {itemId = 37536, count = {1, 1},   chance = 36}, -- nataera bp
        {itemId = 28485, count = {1, 1},   chance = 35}, -- cupcake mana
        {itemId = 28484, count = {1, 1},   chance = 34}, --  cupcake vida
        {itemId = 9086, count = {1, 1},   chance = 33}, -- blessed steak
        {itemId = 9079, count = {1, 1},   chance = 32}, -- rotworm stew
        {itemId = 37317, count = {1, 1},   chance = 31}, -- roulete coin
        {itemId = 28485, count = {1, 1},   chance = 30}, -- cupcake mana
        {itemId = 28484, count = {1, 1},   chance = 29}, -- cupcake vida
        {itemId = 9086, count = {1, 1},   chance = 28}, -- blessed steal
        {itemId = 9079, count = {1, 1},   chance = 27}, -- rotworm stew
        {itemId = 14758, count = {1, 1},   chance = 26}, -- vip scroll 7 days
        {itemId = 44834, count = {1, 1},   chance = 25}, -- oberon chest
        {itemId = 44833, count = {1, 1},   chance = 24}, -- cobra chest
        {itemId = 44832, count = {1, 1},   chance = 23}, -- drume chest
        {itemId = 44831, count = {1, 1},   chance = 22}, -- timira chest
        {itemId = 37317, count = {1, 1},   chance = 21}, -- roulete coin
        {itemId = 44808, count = {1, 1},   chance = 20}, -- EK BOX
        {itemId = 44810, count = {1, 1},   chance = 19}, -- ED BOX
        {itemId = 44809, count = {1, 1},   chance = 18}, -- MS BOX
        {itemId = 44807, count = {1, 1},   chance = 17}, -- RP BOX
        {itemId = 44801, count = {1, 1},   chance = 16}, -- sanguine bp
        {itemId = 36725, count = {1, 1},   chance = 15}, -- stamina
        {itemId = 44791, count = {1, 1},   chance = 14}, -- pizza
        {itemId = 44790, count = {1, 1},   chance = 13}, -- chicken
        {itemId = 22773, count = {1, 1},   chance = 12}, -- boots of homecoming
        {itemId = 14758, count = {1, 1},   chance = 11}, -- vip scroll 7 days
        {itemId = 18339, count = {1, 1},   chance = 10}, -- Zaoan chess box
        {itemId = 28485, count = {1, 1},   chance = 9}, -- cupcake mana
        {itemId = 28484, count = {1, 1},   chance = 8}, -- cupcake vida
        {itemId = 9086, count = {1, 1},   chance = 7}, -- blessed steal
        {itemId = 9079, count = {1, 1},   chance = 6}, -- rotworm
        {itemId = 18339, count = {1, 1},   chance = 5}, -- Zaoan chess box
        {itemId = 34109, count = {1, 1},   chance = 4}, -- soul bag
        {itemId = 39546, count = {1, 1},   chance = 3}, -- primal bag
        {itemId = 43895, count = {1, 1},   chance = 2}, -- sanguine bag
        {itemId = 5903, count = {1, 1},   chance = 1}, -- ferumbras hat
    },

    roulettePositions = {
        Position(843, 1058, 5),
        Position(844, 1058, 5),
        Position(845, 1058, 5),
        Position(846, 1058, 5),
        Position(847, 1058, 5),
        Position(848, 1058, 5), -- position 11 in this list is hard-coded to be the reward location, which is the item given to the player
        Position(849, 1058, 5),
        Position(850, 1058, 5),
        Position(851, 1058, 5),
        Position(852, 1058, 5),
        Position(853, 1058, 5)
    }
}

local chancedItems = {}

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function updateRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 11 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end
        Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
    end

local function clearRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end

        if newItemInfo == nil then
            positions[i]:sendMagicEffect(CONST_ME_POFF)
        else
                Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
        end
    end
end	

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end

    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
    chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance
    return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[11]:sendDistanceEffect(config.roulettePositions[6], config.rouletteOptions.winEffects[1])
            config.roulettePositions[11]:sendDistanceEffect(config.roulettePositions[6], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.roulettePositions do
                config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end

        if effectCounter == 2 then
            local item = Tile(config.roulettePositions[6]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getCount()}
            clearRoulette(newItemInfo)
        end

        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end

    resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end

    local item = Tile(config.roulettePositions[6]):getTopVisibleThing()
    local inbox = player:getInbox()
    if inbox then
        local addedItem = inbox:addItem(item:getId(), 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
    end

    player:sendTextMessage(MESSAGE_STATUS, "Congratulations! You have won " .. item:getName() .. ". The item has been sent to your inbox.")
    player:kv():set(config.rouletteOptions.rouletteStorage, -1)
    player:setMoveLocked(false)
    Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the roulette!", MESSAGE_EVENT_ADVANCE)
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end

    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)

    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end

    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_FAILURE, "Casino Roulette is currently in progress. Please wait.")
        return true
    end

    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:kv():get(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_FAILURE, "Casino Roulette requires " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
            return true
        end
    end

    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}

    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:kv():set(config.rouletteOptions.rouletteStorage, 1)
    player:setMoveLocked(true)

    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:uid(config.uniqueId)
casinoRoulette:register()

local disableMovingItemsToRoulettePositions = EventCallback()

disableMovingItemsToRoulettePositions.playerOnMoveItem = function(self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    for v, k in pairs(config.roulettePositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

disableMovingItemsToRoulettePositions:register()

local rouletteLogout = CreatureEvent("Roulette Logout")

function rouletteLogout.onLogout(player)
    if player:kv():get(config.rouletteOptions.rouletteStorage) == 1 then
        player:sendTextMessage(MESSAGE_FAILURE, "You cannot disconnect while using roulette!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end
    return true
end

rouletteLogout:register()