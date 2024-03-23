local rewards = {
	{ id = 39155, name = "naga sword" },
	{ id = 39156, name = "naga axe" },
	{ id = 39157, name = "naga club" },
	{ id = 39158, name = "frostflower boots" },
	{ id = 39159, name = "naga crossbow" },
	{ id = 39160, name = "feverbloom boots" },
	{ id = 39161, name = "naga quiver" },
	{ id = 39163, name = "naga wand" },
	{ id = 39163, name = "naga rod" },
	{ id = 39164, name = "dawnfire sherwani" },
	{ id = 39165, name = "midnight tunic" },
	{ id = 39166, name = "dawnfire pantaloons" },
	{ id = 39167, name = "midnight sarong" },

}
	
timiraboxId = 44831
local timirabox = Action()

function timirabox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

timirabox:id(timiraboxId)
timirabox:register()