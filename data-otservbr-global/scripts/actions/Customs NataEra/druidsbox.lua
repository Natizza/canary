local rewards = {
	{ id = 44797, name = "arboreal backpack" },
	{ id = 35521, name = "jungle rod" },
	{ id = 37317, name = "Roulette coin" },
	{ id = 27458, name = "rod of destruction" },
	{ id = 8090, name = "spellbook of dark mysteries" },
	{ id = 16107, name = "spellbook of vigilance" },
	{ id = 14769, name = "spellbook of ancient arcana" },
	{ id = 19366, name = "icy culottes" },
	{ id = 28716, name = "falcon rod" },
	{ id = 30400, name = "cobra rod" },
	{ id = 27647, name = "gnome helmet" },
	{ id = 27649, name = "gnome legs" },


}	
druidsboxId = 44810
local druidsbox = Action()

function druidsbox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

druidsbox:id(druidsboxId)
druidsbox:register()
