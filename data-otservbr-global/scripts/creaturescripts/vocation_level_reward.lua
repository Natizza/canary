local table = {
  
        -- [1,5] = VOCATION ID
        -- [LEVEL] = {items = {{itemid = ITEM_ID, count = COUNT}}, storage = YOU_CHOOSE, msg = "MESSAGE FOR THE PLAYER"},

   [{1, 5}] = {
     [20] = {items = {{itemid = 3043, count = 2}}, storage = 40102, msg = "You won 20k for reaching level 20!"},
     [50] = {items = {{itemid = 3043, count = 5}}, storage = 40107, msg = "You won 50k for reaching level 50!"},
     [100] = {items = {{itemid = 3043, count = 8}}, storage = 40103, msg = "You won 80k for reaching level 100!"},
     [150] = {items = {{itemid = 3043, count = 15}}, storage = 40104, msg = "You won 150k for reaching level 150!"},
     [200] = {items = {{itemid = 3043, count = 20}}, storage = 40105, msg = "You won 200k for reaching level 200!"}
   },
   [{2, 6}] = {
     [20] = {items = {{itemid = 3043, count = 2}}, storage = 40102, msg = "You won 20k for reaching level 20!"},
     [50] = {items = {{itemid = 3043, count = 5}}, storage = 40107, msg = "You won 50k for reaching level 50!"},
     [100] = {items = {{itemid = 3043, count = 8}}, storage = 40103, msg = "You won 80k for reaching level 100!"},
     [150] = {items = {{itemid = 3043, count = 15}}, storage = 40104, msg = "You won 150k for reaching level 150!"},
     [200] = {items = {{itemid = 3043, count = 20}}, storage = 40105, msg = "You won 200k for reaching level 200!"}
   },
   [{3, 7}] = {
     [20] = {items = {{itemid = 3043, count = 2}}, storage = 40102, msg = "You won 20k for reaching level 20!"},
     [50] = {items = {{itemid = 3043, count = 5}}, storage = 40107, msg = "You won 50k for reaching level 50!"},
     [100] = {items = {{itemid = 3043, count = 8}}, storage = 40103, msg = "You won 80k for reaching level 100!"},
     [150] = {items = {{itemid = 3043, count = 15}}, storage = 40104, msg = "You won 150k for reaching level 150!"},
     [200] = {items = {{itemid = 3043, count = 20}}, storage = 40105, msg = "You won 200k for reaching level 200!"}
   },
   [{4, 8}] = {
     [20] = {items = {{itemid = 3043, count = 2}}, storage = 40102, msg = "You won 20k for reaching level 20!"},
     [50] = {items = {{itemid = 3043, count = 5}}, storage = 40107, msg = "You won 50k for reaching level 50!"},
     [100] = {items = {{itemid = 3043, count = 8}}, storage = 40103, msg = "You won 80k for reaching level 100!"},
     [150] = {items = {{itemid = 3043, count = 15}}, storage = 40104, msg = "You won 150k for reaching level 150!"},
     [200] = {items = {{itemid = 3043, count = 20}}, storage = 40105, msg = "You won 200k for reaching level 200!"}
   }
}

local rewardLevel = CreatureEvent("RewardLevel")
function rewardLevel.onAdvance(player, skill, oldLevel, newLevel)


    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        
        return true
    
    end

        for voc, x in pairs(table) do
            if isInArray(voc, player:getVocation():getId()) then
                for level, z in pairs(x) do
                    if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
                        for v = 1, #z.items do
                            local ret = ", "
                            if v == 1 then
                            ret = ""
                        
                                        end
                        player:addItem(z.items[v].itemid, z.items[v].count)
                            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
                            player:setStorageValue(z.storage, 1)
                        end
                        end
                end
      
            player:save()

            return true
   
            end
         end
end

rewardLevel:register()