local rewards = {
	{ id = 30393, name = "cobra crossbow" },
	{ id = 30394, name = "cobra boots" },
	{ id = 30395, name = "cobra club" },
	{ id = 30396, name = "cobra axe" },
	{ id = 30397, name = "cobra hood" },
	{ id = 30398, name = "cobra sword" },
	{ id = 30399, name = "cobra wand" },
	{ id = 30400, name = "cobra rod" },

}
	
cobraboxId = 44833
local cobrabox = Action()

function cobrabox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return false
	end
	
	local rewardItem = rewards[math.random(1, #rewards)]
	
    if rewardItem.id == 3043 then
        -- If the reward is a crystal coin, give a fixed quantity of 20
        player:addItem(rewardItem.id, 20)
        item:remove(1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received 20 " .. rewardItem.name .. "s.")
        return true
    else
        -- For other rewards, proceed with giving the item
        player:addItem(rewardItem.id, 1)
        item:remove(1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a " .. rewardItem.name .. ".")
        return true
    end
end

cobrabox:id(cobraboxId)
cobrabox:register()