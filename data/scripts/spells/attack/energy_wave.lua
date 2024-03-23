local function formulaFunction(player, level, maglevel)
    local damageModifier = 1.0
    local sanguineBootsID = {43884}
    local powerfulWeaponsIDs = {43883}
    local strongWeaponsIDs = {43882}

    for slot = CONST_SLOT_LEGS, CONST_SLOT_FEET do
        local sanguineItem = player:getSlotItem(slot)

        if sanguineItem and table.contains(sanguineBootsID, sanguineItem:getId()) then
        	Spdlog.info("Sanguine Boots")
            damageModifier = damageModifier * 1.08
        end
    end

    for slot = CONST_SLOT_RIGHT, CONST_SLOT_LEFT do
        local equippedWeapon = player:getSlotItem(slot)

        if equippedWeapon then
            if table.contains(powerfulWeaponsIDs, equippedWeapon:getId()) then
            	Spdlog.info("Grand Sanguine Coil")
                damageModifier = damageModifier * 1.1
            elseif table.contains(strongWeaponsIDs, equippedWeapon:getId()) then
            	Spdlog.info("Sanguine Coil")
                damageModifier = damageModifier * 1.05
            end
        end
    end
    
	local min = (level / 5) + (maglevel * 5) +140
	local max = (level / 5) + (maglevel * 8.2) +140

    local finalMinDamage = -min * damageModifier
    local finalMaxDamage = -max * damageModifier
    return finalMinDamage, finalMaxDamage
end

function onGetFormulaValues(player, level, maglevel)
	return formulaFunction(player, level, maglevel)
end

function onGetFormulaValuesWOD(player, level, maglevel)
	return formulaFunction(player, level, maglevel)
end

local function createCombat(area, areaDiagonal, combatFunc)
	local initCombat = Combat()
	initCombat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, combatFunc)
	initCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
	initCombat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
	initCombat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
	initCombat:setArea(createCombatArea(area, areaDiagonal))
	return initCombat
end

local combat = createCombat(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5, "onGetFormulaValues")
local combatWOD = createCombat(AREA_WAVE7, AREADIAGONAL_WAVE7, "onGetFormulaValuesWOD")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()		
		if player:getWheelSpellAdditionalArea("Energy Wave") then
			return combatWOD:execute(creature, var)
		end
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(13)
spell:name("Energy Wave")
spell:words("exevo vis hur")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ENERGY_WAVE)
spell:level(38)
spell:mana(170)
spell:needDirection(true)
spell:cooldown(5 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
