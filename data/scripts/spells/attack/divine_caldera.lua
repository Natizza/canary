local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, maglevel)
    local damageModifier = 1.0

    local strongWeapons = {43877, 43879}
    local powerfulWeapons = {43878, 43880}
    local sanguineGreaves = {43881}

    for slot = CONST_SLOT_LEGS, CONST_SLOT_FEET do
        local sanguineItem = player:getSlotItem(slot)

        if sanguineItem and table.contains(sanguineGreaves, sanguineItem:getId()) then
            damageModifier = damageModifier * 1.08
        end
    end

    for slot = CONST_SLOT_RIGHT, CONST_SLOT_LEFT do
        local playerWeapon = player:getSlotItem(slot)

        if playerWeapon then
            local min = (level / 5) + (maglevel * 10) + 35
            local max = (level / 5) + (maglevel * 12.2) + 55

            if table.contains(powerfulWeapons, playerWeapon:getId()) then
                damageModifier = damageModifier * 1.1
            elseif table.contains(strongWeapons, playerWeapon:getId()) then
                damageModifier = damageModifier * 1.05
            end
        end
    end
    
	local min = (level / 5) + (maglevel * 5) +190
	local max = (level / 5) + (maglevel * 8) +240

    local finalMinDamage = -min * damageModifier
    local finalMaxDamage = -max * damageModifier

    return finalMinDamage, finalMaxDamage
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(124)
spell:name("Divine Caldera")
spell:words("exevo mas san")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_DIVINE_CALDERA)
spell:level(50)
spell:mana(160)
spell:isPremium(false)
spell:isSelfTarget(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("paladin;true", "royal paladin;true")
spell:register()
