local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(player, skill, attack, factor)
    -- Arrays para armas específicas
    local strongWeapons = {43864, 43866, 43868, 43870, 43872, 43874}
    local powerfulWeapons = {43865, 43867, 43869, 43871, 43873, 43875}
    local sanguineLegs = {43876}

    -- Cálculos comunes
    local totalSkill = skill * attack
    local levelTotal = player:getLevel() / 5

    -- Inicializar modificadores de daño
    local skillModifier = 0.14
    local baseValue = 14
    local damageModifier = 1.0

    for slot = CONST_SLOT_LEGS, CONST_SLOT_FEET do
        local sanguineItem = player:getSlotItem(slot)

        if sanguineItem and table.contains(sanguineLegs, sanguineItem:getId()) then
            damageModifier = damageModifier * 1.08
        end
    end

    for slot = CONST_SLOT_RIGHT, CONST_SLOT_LEFT do
        local equippedWeapon = player:getSlotItem(slot)

        if equippedWeapon then
            if table.contains(powerfulWeapons, equippedWeapon:getId()) then
                damageModifier = damageModifier * 1.1
            elseif table.contains(strongWeapons, equippedWeapon:getId()) then
                damageModifier = damageModifier * 1.05
            end
        end
    end
    local damageMin = -((totalSkill * skillModifier) + baseValue + levelTotal) * damageModifier
    local damageMax = -((totalSkill * 0.16) + 18 + levelTotal) * damageModifier
    return damageMin, damageMax
end

function calculateDamage(totalSkill, levelTotal, skillMultiplier, baseValue, modifier)
    return -((totalSkill * skillMultiplier) + baseValue + levelTotal) * modifier
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(105)
spell:name("Fierce Berserk")
spell:words("exori gran")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_FIERCE_BERSERK)
spell:level(90)
spell:mana(340)
spell:isPremium(false)
spell:needWeapon(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()
