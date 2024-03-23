local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, maglevel)
    local damageModifier = 1.0
    local sanguineGaloshesID = {43887}
    local powerfulWeaponsIDs = {43886}
    local strongWeaponsIDs = {43885}

    for slot = CONST_SLOT_LEGS, CONST_SLOT_FEET do
        local sanguineItem = player:getSlotItem(slot)

        if sanguineItem and table.contains(sanguineGaloshesID, sanguineItem:getId()) then
        	Spdlog.info("Sanguine Galoshes")
            damageModifier = damageModifier * 1.08
        end
    end

    for slot = CONST_SLOT_RIGHT, CONST_SLOT_LEFT do
        local equippedWeapon = player:getSlotItem(slot)

        if equippedWeapon then
            if table.contains(powerfulWeaponsIDs, equippedWeapon:getId()) then
            	Spdlog.info("Powerful Sanguine")
                damageModifier = damageModifier * 1.1
            elseif table.contains(strongWeaponsIDs, equippedWeapon:getId()) then
            	Spdlog.info("Strong Sanguine")
                damageModifier = damageModifier * 1.05
            end
        end
    end
    
	local min = (level / 5) + (maglevel * 6.3) +170
	local max = (level / 5) + (maglevel * 12.3) +170

    local finalMinDamage = -min * damageModifier
    local finalMaxDamage = -max * damageModifier
    return finalMinDamage, finalMaxDamage
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(118)
spell:name("Eternal Winter")
spell:words("exevo gran mas frigo")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ETERNAL_WINTER)
spell:level(60)
spell:mana(1050)
spell:isPremium(false)
spell:range(5)
spell:isSelfTarget(true)
spell:cooldown(20 * 1000)
spell:groupCooldown(4 * 1000, 5 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()
