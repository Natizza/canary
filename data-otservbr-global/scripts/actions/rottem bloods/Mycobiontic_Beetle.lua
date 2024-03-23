local mType = Game.createMonsterType("Mycobiontic Beetle")
local monster = {}

monster.description = "a Mycobiontic Beetle"
monster.experience = 20360
monster.outfit = {
	lookType = 1620,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}


monster.raceId = 2375
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Sanctuary."
	}

monster.health = 30200
monster.maxHealth = 30200
monster.race = "undead"
monster.corpse = 43555
monster.speed = 230
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = false,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {

}

monster.loot = {
	{ name = "crystal coin", chance = 6527, maxCount = 1 },
	{ name = "lichen gobbler", chance = 14607, maxCount = 1 },
	{ name = "white mushroom", chance = 6496, maxCount = 3 },
	{ name = "rotten roots", chance = 5404, maxCount = 1 },
	{ name = "wand of decay", chance = 13616, maxCount = 1 },
	{ id = 3039, chance = 14416, maxCount = 1 }, -- red gem
	{ name = "worm sponge", chance = 6294, maxCount = 1 },
	{ name = "dark mushroom", chance = 13177, maxCount = 3 },
	{ name = "yellow gem", chance = 6666, maxCount = 1 },
	{ name = "brown mushroom", chance = 7898, maxCount = 3 },
	{ name = "terra amulet", chance = 13450, maxCount = 1 },
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HOLYDAMAGE, minDamage = -700, maxDamage = -2100, range = 7, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -650, maxDamage = -2100, range = 7, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = true},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -650, maxDamage = -1100, range = 7, radius = 4, effect = CONST_ME_ENERGYAREA, target = false}
}

monster.defenses = {
	defense = 100,
	armor = 116
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = 35},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -25},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
