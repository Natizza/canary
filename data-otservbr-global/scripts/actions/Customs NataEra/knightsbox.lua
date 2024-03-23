local rewards = {
	{ id = 44799, name = "spiritthorn backpack" },
	{ id = 37317, name = "Roulette coin" },
	{ id = 27449, name = "blade of destruction" },
	{ id = 27451, name = "axe of destruction" },
	{ id = 27453, name = "mace of destruction" },
	{ id = 14000, name = "ornate shield" },
	{ id = 8862, name = "yalahari armor" },
	{ id = 16110, name = "prismatic armor" },
	{ id = 3398, name = "dwarven legs" },
	{ id = 28719, name = "falcon plate" },
	{ id = 30395, name = "cobra club" },
	{ id = 32617, name = "fabulous legs" },


}
	
druidsboxId = 44808
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
