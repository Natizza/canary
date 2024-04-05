local config = {
    { name = "Cities"},
    { name = "Bosses" },
--    { name = "Trainer", position = Position(1116, 1094, 7) },
    { name = "House", action = "teleportHouse" },

}


function teleportHouse(player)
    local house = player:getHouse()
    if not house then
        player:sendCancelMessage("You don't have a house.")
        return false
    else
        player:teleportTo(house:getExitPosition())
        return true
    end
end

local Bosses = {
    { name = "Leiden", position = Position(32668, 31542, 9) },
	{ name = "Lord Azaram", position = Position(33423, 31497, 13) },
	{ name = "Sir Baeloc-Nictros", position = Position(33426, 31408, 13) },
	{ name = "Brain Head", position = Position(31973, 32325, 10) },
	{ name = "Brainstealer", position = Position(32532, 31119, 15) },
	{ name = "Bragrumol", position = Position(33790, 31598, 8) },
	{ name = "Brokul", position = Position(33522, 31468, 15) },
	{ name = "Count Vlarkorth", position = Position(33456, 31408, 13) },
	{ name = "Dragonking Zyrtarch", position = Position(33391, 31183, 10) },
	{ name = "Dreams Courts", position = Position(32219, 32047, 13) },
	{ name = "Duke Krule", position = Position(33456, 31497, 13) },
	{ name = "Drume", position = Position(32458, 32507, 6) },
	{ name = "Earl Osam", position = Position(33517, 31440, 13) },
	{ name = "Faceless Bane", position = Position(33638, 32560, 13) },
	{ name = "Ferumbras Mortal Shell", position = Position(33294, 31454, 12.) },
	{ name = "Frozen Horror", position = Position(32302, 31093, 14) },
    { name = "Gold Token", position = Position(32213, 31376, 14) },
	{ name = "Gnomprona", position = Position(33517, 32857, 14) },
	{ name = "Goshnar Cruelty", position = Position(33859, 31854, 6) },
	{ name = "Goshnar Greed", position = Position(33781, 31665, 14) },
	{ name = "Goshnar Hatred", position = Position(33778, 31601, 14) },
	{ name = "Goshnar Malice", position = Position(33684, 31599, 14) },
	{ name 	= "Goshnar Spite", position = Position(33779, 31634, 14) },
	{ name = "King Zelos", position = Position(32172, 31918, 8) },
	{ name = "Last Lore Keeper", position = Position(32019, 32849, 14) },
	{ name = "Lloyd", position = Position(32759, 32873, 14) },
	{ name = "Library", position = Position(32515, 32535, 12) },
    { name = "Grand Master Oberon", position = Position(33363, 31342, 9) },
	{ name = "Pale Worm", position = Position(33776, 31504, 14) },
	{ name = "Ratmiral", position = Position(33891, 31197, 7) },
	{ name = "Scarlett Etzel", position = Position(33395, 32662, 6) },
	{ name = "Soulwar Hub", position = Position(33621, 31427, 10) },
	{ name = "Shadowpelt", position = Position(33403, 32097, 9) },
	{ name = "Tentugly", position = Position(33791, 31386, 6) },
	{ name = "Thorn Knight", position = Position(32657, 32882, 14) },
	{ name = "Timira", position = Position(33804, 32702, 7) },
	{ name = "Time Guardian", position = Position(33010, 31665, 14) },
	{ name = "Urmahlullu", position = Position(33920, 31623, 8) }, 
    { name = "Wz 1,2,3", position = Position(32801, 31766, 9)},
    { name = "Wz 4,5,6", position = Position(33745, 32191, 14)},
    { name = "Wz 7,8,9", position = Position(32660, 31829, 10)},
}

local Cities = {

    { name = "Ab'dendriel", position = Position(32732, 31634, 7) },
    { name = "Carlin", position = Position(32360, 31782, 7) },
    { name = "Thais", position = Position(32369, 32241, 7) },
    { name = "Venore", position = Position(32957, 32076, 7) },
    { name = "Yalahar", position = Position(32787, 31276, 7) },
    { name = "Edron", position = Position(33217, 31814, 8) },
    { name = "Svargrond", position = Position(32212, 31132, 7) },
    { name = "Kazordoon", position = Position(32649, 31925, 11) },
    { name = "Ankrahmun", position = Position(33194, 32853, 8) },
    { name = "Darashia", position = Position(33213, 32454, 1) },
    { name = "Farmine", position = Position(33023, 31521, 11) },
    { name = "Liberty Bay", position = Position(32317, 32826, 7) },
	{ name = "Marapur", position = Position(33776, 32754, 5) },
    { name = "Port Hope", position = Position(32594, 32745, 7) },
    { name = "Gray Beach", position = Position(33447, 31323, 9) },
    { name = "Krailos", position = Position(33657, 31665, 8) },
    { name = "Rathleton", position = Position(33594, 31899, 6) },
    { name = "Roshamuul", position = Position(33513, 32363, 6) },
    { name = "Issavi", position = Position(33921, 31477, 5) },
    -- Agrega más ciudades según sea necesario
}

local teleportCube = Action()
function teleportCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) or player:isPzLocked()) 
        and not (Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)) or
        Tile(player:getPosition()):hasFlag(TILESTATE_NOLOGOUT) then
        player:sendCancelMessage("You can't use this when you're in a fight.")
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end    local window = ModalWindow {
        title = "Teleport Modal",
        message = "Locations"
    }

    for _, info in pairs(config) do
        window:addChoice(info.name, function(player, button, choice)
            if button.name ~= "Select" then
                return true
            end

            if info.name == "Bosses" then
                openLocationsModal(player, Bosses)
            elseif info.name == "Cities" then
                openLocationsModal(player, Cities)
            elseif info.name == "House" then
                teleportHouse(player)
            else
                teleportPlayer(player, info.position, info.name)
            end

            return true
        end)
    end

    window:addButton("Select")
    window:addButton("Close")
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(player)
    return true
end
teleportCube:id(31633) -- Reemplaza el ID del item con el que desees
teleportCube:register()

function openLocationsModal(player, locations)
    local locationsWindow = ModalWindow {
        title = "Locations",
        message = "Select a Location"
    }

    for _, location in ipairs(locations) do
        locationsWindow:addChoice(location.name, function(player, button, choice)
            if button.name ~= "Select" then
                return true
            end
            teleportPlayer(player, location.position, location.name)
            return true
        end)
    end

    locationsWindow:addButton("Select")
    locationsWindow:addButton("Close")
    locationsWindow:setDefaultEnterButton(0)
    locationsWindow:setDefaultEscapeButton(1)
    locationsWindow:sendToPlayer(player)
end

function teleportPlayer(player, position, locationName)
    local cubeCooldown = 1 * 30 -- 1 minute
    local cubeTimerStorage = Storage.SupremeCubeTimer

    local playerTimerValue = player:getStorageValue(cubeTimerStorage)

    if playerTimerValue < os.time() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. locationName)
        player:teleportTo(position)
        player:getPosition():sendMagicEffect(CONST_ME_SUPREME_CUBE)

        -- Establece el nuevo valor del temporizador con el tiempo actual más el tiempo de enfriamiento
        player:setStorageValue(cubeTimerStorage, os.time() + cubeCooldown)
    else
        local remainingCooldown = playerTimerValue - os.time()
        player:sendCancelMessage("You cannot use this item yet. It is still on cooldown. Please wait " .. math.ceil(remainingCooldown / 60) .. " minutes.")
    end
end