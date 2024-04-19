local rewards = {
{ id = 35515, name = "Throwing Axe" },
{ id = 35523, name = "Exotic Amulet" },
{ id = 35517, name = "Bast Legs" },
{ id = 35516, name = "Exotic Legs" },
{ id = 35518, name = "Jungle Bow" },
{ id = 35514, name = "Jungle Flail" },
{ id = 35524, name = "Jungle Quiver" },
{ id = 35521, name = "Jungle Rod" },
{ id = 35520, name = "Make-do Boots" },
{ id = 35519, name = "Makeshift Boots" },
{ id = 35522, name = "Jungle wand" }
}
	
ratmiralboxId = 44829
local ratmiralbox = Action()

function ratmiralbox.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

ratmiralbox:id(ratmiralboxId)
ratmiralbox:register()
