local rewards = {
	{ id = 44800, name = "alicorn backpack" },
	{ id = 37317, name = "Roulette coin" },
	{ id = 27455, name = "bow of destruction" },
	{ id = 27456, name = "crossbow of destruction" },
	{ id = 29427, name = "dark whispers" },
	{ id = 16111, name = "prismatic legs" },
	{ id = 16110, name = "prismatic armor" },
	{ id = 10385, name = "Zaoan helmet" },
	{ id = 35524, name = "jungle quiver" },
	{ id = 27648, name = "gnome armor" },
	{ id = 32617, name = "fabulous legs" },
	{ id = 28718, name = "falcon bow" },

}	
paladinboxId = 44807
local paladinbox = Action()

function paladinbox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

paladinbox:id(paladinboxId)
paladinbox:register()
