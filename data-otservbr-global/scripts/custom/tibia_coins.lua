function format_num(amount)
    local formatted = amount
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')
        if k == 0 then
            break
        end
    end
    return formatted
end

local add_tibiaCoins = TalkAction("/addtc")

function add_tibiaCoins.onSay(player, words, param)    

    if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
        return true
    end
    local usage = "/addtc PLAYER NAME,TC AMOUNT"
    if param == "" then
        player:sendCancelMessage("Command param required. Usage: ".. usage)
        return false
    end

    local split = param:split(",")
    if not split[2] then
        player:sendCancelMessage("Insufficient parameters. Usage: ".. usage)
        return false
    end

    local target = Player(split[1])
    if not target then
        player:sendCancelMessage("A player with that name is not online.")
        return false
    end
    --trim left
    split[2] = split[2]:gsub("^%s*(.-)$", "%1")
    
    player:sendCancelMessage("Added " .. format_num(split[2]) .. " tibia coins to the character '" .. target:getName() .. "'.")
    target:sendCancelMessage("Received " .. split[2] .. " tibia coins!")
    target:addTransferableCoins(tonumber(split[2]))
    target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)


end

add_tibiaCoins:separator(" ")
add_tibiaCoins:groupType("god")
add_tibiaCoins:register()

local remove_tibiaCoins = TalkAction("/rmvtc")

function remove_tibiaCoins.onSay(player, words, param)    

    if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
        return true
    end
    local usage = "/rmvtc PLAYER NAME,TC AMOUNT"
    if param == "" then
        player:sendCancelMessage("Command param required. Usage: ".. usage)
        return false
    end

    local split = param:split(",")
    if not split[2] then
        player:sendCancelMessage("Insufficient parameters. Usage: ".. usage)
        return false
    end

    local target = Player(split[1])
    if not target then
        player:sendCancelMessage("A player with that name is not online.")
        return false
    end
    --trim left
    split[2] = split[2]:gsub("^%s*(.-)$", "%1")
    
    player:sendCancelMessage("Removed " .. format_num(split[2]) .. " tibia coins of the character '" .. target:getName() .. "'.")
    target:sendCancelMessage("Removed " .. split[2] .. " tibia coins!")
    target:removeTransferableCoins(tonumber(split[2]))
    target:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)


end

remove_tibiaCoins:separator(" ")
remove_tibiaCoins:groupType("god")
remove_tibiaCoins:register()

local tibiaCoins = TalkAction("/tc")

function tibiaCoins.onSay(player, words, param)    

    if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
        return true
    end
    local usage = "/tc PLAYER NAME"
    if param == "" then
        player:sendCancelMessage("Command param required. Usage: ".. usage)
        return false
    end

    local target = Player(param) -- Altere de split[1] para param
    if not target then
        player:sendCancelMessage("A player with that name is not online.")
        return false
    end

    player:sendCancelMessage("'" .. target:getName() .. "' have " .. format_num(target:getTransferableCoins()) .. " tibia coins.")
end

tibiaCoins:separator(" ")
tibiaCoins:groupType("god")
tibiaCoins:register()