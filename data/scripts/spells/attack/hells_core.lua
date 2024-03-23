local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, maglevel)
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
            	Spdlog.info("Sanguine Coil")
                damageModifier = damageModifier * 1.1
            elseif table.contains(strongWeaponsIDs, equippedWeapon:getId()) then
            	Spdlog.info("Grand Sanguine Coil")
                damageModifier = damageModifier * 1.05
            end
        end
    end
    
	local min = (level / 5) + (maglevel * 7.2) +150
	local max = (level / 5) + (maglevel * 13.3) +150

    local finalMinDamage = -min * damageModifier
    local finalMaxDamage = -max * damageModifier
    return finalMinDamage, finalMaxDamage
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("attack", "focus")
spell:id(24)
spell:name("Hell's Core")
spell:words("exevo gran mas flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HELL_SCORE)
spell:level(60)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:cooldown(15 * 1000)
spell:groupCooldown(4 * 1000, 5 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()
