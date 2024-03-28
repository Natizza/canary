local rewards = {
	{ id = 34150, name = "lion longbow" },
	{ id = 34151, name = "lion rod" },
	{ id = 34152, name = "lion wand" },
	{ id = 34153, name = "lion spellbook" },
	{ id = 34154, name = "lion shield" },
	{ id = 34155, name = "lion longsword" },
	{ id = 34156, name = "lion spangenhelm" },
	{ id = 34157, name = "lion plate" },

}
	
drumeboxId = 44832
local drumebox = Action()

function drumebox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

drumebox:id(drumeboxId)
drumebox:register()