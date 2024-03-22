taskOptions = {
	bonusReward = 65001, -- storage bonus reward
	bonusRate = 2, -- rate bonus reward
	taskBoardPositions = {
        {x = 32343, y = 32219, z = 7},
        {x = 32343, y = 32219, z = 7},
    },
	selectLanguage = 2, -- options: 1 = pt_br or 2 = english
	uniqueTask = false, -- do one task at a time
	uniqueTaskStorage = 65002
}

task_pt_br = {
	exitButton = "Fechar",
	confirmButton = "Validar",
	cancelButton = "Anular",
	returnButton = "Voltar",
	title = "Quadro De Missões",
	missionError = "Missão esta em andamento ou ela já foi concluida.",
	uniqueMissionError = "Você só pode fazer uma missão por vez.",
	missionErrorTwo = "Você concluiu a missão",
	missionErrorTwoo = "\nAqui estão suas recompensas:",
	choiceText = "- Experiência: ",
	messageAcceptedText = "Você aceitou essa missão!",
	messageDetailsText = "Detalhes da missão:",
	choiceMonsterName = "Missão: ",
	choiceMonsterRace = "Raças: ",
	choiceMonsterKill = "Abates: ",
	choiceEveryDay = "Repetição: Todos os dias",
	choiceRepeatable = "Repetição: Sempre",
	choiceOnce = "Repetição: Apenas uma vez",
	choiceReward = "Recompensas:",
	messageAlreadyCompleteTask = "Você já concluiu essa missão.",
	choiceCancelTask = "Você cancelou essa missão",
	choiceCancelTaskError = "Você não pode cancelar essa missão, porque ela já foi concluída ou não foi iniciada.",
	choiceBoardText = "Escolha uma missão e use os botões abaixo:",
	choiceRewardOnHold = "Resgatar Prêmio",
	choiceDailyConclued = "Diária Concluída",
	choiceConclued = "Concluída",
	messageTaskBoardError = "O quadro de missões esta muito longe ou esse não é o quadro de missões correto.",
	messageCompleteTask = "Você terminou essa missão! \nRetorne para o quadro de missões e pegue sua recompensa.",
}

taskConfiguration = {
{name = "Minotaur", color = 40, total = 5000, type = "daily", storage = 190000, storagecount = 190001, 
	rewards = {
	{5804, 1},
	{"exp", 1000000},
	},
	races = {
		"Minotaur",
		"Minotaur Archer",
		"Minotaur Mage",
	},
},

{name = "Dragon", color = 40, total = 7000, type = "daily", storage = 190002, storagecount = 190003, 
	rewards = {
	{3043, 100},
	{5908, 1},
	{5919, 1},
	{"exp", 2500000},
	},
	races = {
		"Dragon",
		"Dragon Lord",
		"Dragon Hatchling",
		"Dragon Lord Hatchling",
		"Dragon Lord",
		"Dragon Lord Hatchling",
	},
},


{name = "Rotworm", color = 40, total = 250, type = "once", storage = 190006, storagecount = 190007, 
	rewards = {
	{3043, 10},
	{"exp", 100000},
	},
	races = {
		"Rotworm",
		"Carrion Worm",
		"White Pale",
		"Rotworm Queen",
	},
},

{name = "Amazon", color = 40, total = 2500, type = "repeatable", storage = 190008, storagecount = 190009, 
	rewards = { 
	{"exp", 1500000},
	},
	races = {
		"Amazon",
		"Valkyrie",
		"Xenia",
	},
},


{name = "Enfeebled Silencer", color = 40, total = 1000, type = "daily", storage = 190014, storagecount = 190015, 
	rewards = { 
	{22721, 10},
	},
	races = {
		"Enfeebled Silencer",
	},
},

{name = "Deepling", color = 40, total = 1000, type = "daily", storage = 190016, storagecount = 190017, 
	rewards = { 
	{14142, 1},
	{"exp", 10000000},
	},
	races = {
		"Deepling Guard",
		"Deepling Warrior",
		"Deepling Scout",
	},
},

{name = "Roshamuul", color = 40, total = 7000, type = "daily", storage = 190018, storagecount = 190019, 
	rewards = { 
	{20271, 1},
	{"exp", 10000000},
	{22516, 10},
	{20270, 1},
	{20272, 1},
	{3043, 100},
	},
	races = {
		"Silencer",
		"Frazzlemaw",
		"Guzzlemaw",
	},
},

{name = "Library", color = 40, total = 7000, type = "daily", storage = 190020, storagecount = 190021, 
	rewards = { 
	{"exp", 25000000},
	{9086, 1},
	{9079, 1},
	{28485, 1},
	{28484, 1},
	},
	races = {
		"Guardian Of Tales",
		"Flying Book",
		"Rage Squid",
		"Burning Book",
		"Ink Blob",
		"Brain Squid",
		"Energuardian Of Tales",
		"Energetic Book",
		"Animated Feather",
		"Icecold Book",
		"Squid Warden",
		"Biting Book",
		"Cursed Book",
	},
},

{name = "Demon", color = 40, total = 3000, type = "daily", storage = 190022, storagecount = 190023, 
	rewards = { 
	{"exp", 10000000},
	},
	races = {
		"Demon",
	},
},

{name = "Cloak Of Terror", color = 40, total = 50000, type = "daily", storage = 190026, storagecount = 190027, 
	rewards = { 
	{"exp", 30000000},
	{34109,1},
	{3043, 300},	

	},
	races = {
		"Cloak Of Terror",
		"Vibrant Phantom",
		"Courage Leech",
	},
},

{name = "Rotten Golem", color = 40, total = 50000, type = "daily", storage = 190028, storagecount = 190029,
	rewards = { 
	{"exp", 30000000},
	{34109,1},
	{3043, 300},
	},
	races = {
		"Rotten Golem",
		"Branchy Crawler",
		"Mould Phantom",
	},
},

{name = "Infernal Demon", color = 40, total = 50000, type = "daily", storage = 190032, storagecount = 190033, 
	rewards = { 
	{"exp", 30000000},
	{34109,1},
	{3043, 300},
	},
	races = {
		"Brachiodemon",
		"Infernal Demon",
		"Infernal Phantom",
	},
},
{name = "Gnomprona", color = 40, total = 70000, type = "daily", storage = 190034, storagecount = 190035, 
	rewards = { 
	{"exp", 40000000},
	{39546,1},
	{3043, 300},
	},
	races = {
		"Hulking Prehemoth",
		"Emerald Tortoise",
		"Gore Horn",
		"Gorerilla",
		"Undertaker",
		"Sulphider",
		"Nighthunter",
		"Sulphur Spouter",
		"Noxious Ripptor",
		"Shrieking Cry-Stal",
		"Mantosaurus",
		"Headpecker",
		"Mercurial Menace",
	},
},
{name = "Rotten Blood", color = 40, total = 100000, type = "daily", storage = 190036, storagecount = 190037, 
	rewards = { 
	{"exp", 50000000},
	{43898,1},
	{3043, 300},
	},
	races = {
		"Darklight Emitter",
		"Converter",
		"Wandering Pillar",
		"Darklight Construct",
		"Mycobiontic Beetle",
		"Oozing Corpus",
		"Bloated Man-Maggot",
		"Sopping Corpus",
		"Oozing Carcass",
		"Rotten Man-Maggot",
		"Meandering Mushroom",
		"Sopping Carcass",
		"Darklight Matter",
		"Walking Pillar",
		"Darklight Source",
	},
},

{name = "Ferumbras", color = 40, total = 10000, type = "daily", storage = 190038, storagecount = 190039, 
	rewards = {
	{"exp", 35000000},
	{3043, 500},
	},
	races = {
		"Juggernaut",
		"Vexclaw",
		"Grimeleech",
		"Hellflayer",
		"Hellhound",
		"Dark Torturer",
	},
},

{name = "Asuras", color = 40, total = 3000, type = "daily", storage = 190040, storagecount = 190041, 
	rewards = { 
	{"exp", 20000000},
	{3043, 100},
	},
	races = {
		"Dawnfire Asura",
		"Midnight Asura",
		"Hellspawn",
	},
},

{name = "Girtablilu Warrior", color = 40, total = 5000, type = "daily", storage = 190042, storagecount = 190043, 
	rewards = {   
	{"exp", 25000000},
	{3043, 100},
	},
	races = {
		"Girtablilu Warrior",
		"Venerable Girtablilu",
	},
},

{name = "Dark Carnisylvan", color = 40, total = 5000, type = "daily", storage = 190044, storagecount = 190045, 
	rewards = { 
	{"exp", 5000000},
	{3043, 50},
	},
	races = {
		"Dark Carnisylvan",
	},
},
}

squareWaitTime = 5000
taskQuestLog = 65000 -- A storage so you get the quest log
dailyTaskWaitTime = 20 * 60 * 60 

function Player.getCustomActiveTasksName(self)
local player = self
	if not player then
		return false
	end
local tasks = {}
	for i, data in pairs(taskConfiguration) do
		if player:getStorageValue(data.storagecount) ~= -1 then
		tasks[#tasks + 1] = data.name
		end
	end
	return #tasks > 0 and tasks or false
end


function getTaskByStorage(storage)
	for i, data in pairs(taskConfiguration) do
		if data.storage == tonumber(storage) then
			return data
		end
	end
	return false
end

function getTaskByMonsterName(name)
	for i, data in pairs(taskConfiguration) do
		for _, dataList in ipairs(data.races) do
		if dataList:lower() == name:lower() then
			return data
		end
		end
	end
	return false
end

function Player.startTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if player:getStorageValue(taskQuestLog) == -1 then
		player:setStorageValue(taskQuestLog, 1)
	end
	player:setStorageValue(storage, player:getStorageValue(storage) + 1)
	player:setStorageValue(data.storagecount, 0)
	return true
end

function Player.canStartCustomTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if data.type == "daily" then
		return os.time() >= player:getStorageValue(storage)
	elseif data.type == "once" then
		return player:getStorageValue(storage) == -1
	elseif data.type[1] == "repeatable" and data.type[2] ~= -1 then
		return player:getStorageValue(storage) < (data.type[2] - 1)
	else
		return true
	end
end

function Player.endTask(self, storage, prematurely)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
end
	if prematurely then
		if data.type == "daily" then
			player:setStorageValue(storage, -1)
		else
			player:setStorageValue(storage, player:getStorageValue(storage) - 1)
	end
	else
		if data.type == "daily" then
			player:setStorageValue(storage, os.time() + dailyTaskWaitTime)
		end
	end
	player:setStorageValue(data.storagecount, -1)
	return true
end

function Player.hasStartedTask(self, storage)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	return player:getStorageValue(data.storagecount) ~= -1
end


function Player.getTaskKills(self, storage)
local player = self
	if not player then
		return false
	end
	return player:getStorageValue(storage)
end

function Player.addTaskKill(self, storage, count)
local player = self
	if not player then
		return false
	end
local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	local kills = player:getTaskKills(data.storagecount)
	if kills >= data.total then
		return false
	end
	if kills + count >= data.total then
		if taskOptions.selectLanguage == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, task_pt_br.messageCompleteTask)
		else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Task System] You have finished this task! To claim your rewards, return to the quest board and claim your reward.")
		end
		return player:setStorageValue(data.storagecount, data.total)
	end
		player:say('Task: '..data.name ..' - ['.. kills + count .. '/'.. data.total ..']', TALKTYPE_MONSTER_SAY)
		return player:setStorageValue(data.storagecount, kills + count)
end