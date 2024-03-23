local rewards = {
	{ id = 28715, name = "falcon coif" },
	{ id = 28716, name = "falcon rod" },
	{ id = 28717, name = "falcon wand" },
	{ id = 28718, name = "falcon bow" },
	{ id = 28719, name = "falcon plate" },
	{ id = 28720, name = "falcon greaves" },
	{ id = 28721, name = "falcon shield" },
	{ id = 28722, name = "falcon escutcheon" },
	{ id = 28723, name = "falcon longsword" },
	{ id = 28724, name = "falcon battleaxe" },
	{ id = 28725, name = "falcon mace" },

}
	
falconboxId = 44834
local falconbox = Action()

function falconbox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

falconbox:id(falconboxId)
falconbox:register()