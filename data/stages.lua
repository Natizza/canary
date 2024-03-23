-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 100,
		multiplier = 200,
	},
	{
		minlevel = 101,
		maxlevel = 200,
		multiplier = 150,
	},
	{
		minlevel = 201,
		maxlevel = 300,
		multiplier = 100,
	},
	{
		minlevel = 301,
		maxlevel = 400,
		multiplier = 75,
	},
	{
		minlevel = 401,
		maxlevel = 600,
		multiplier = 50,
	},
		{
		minlevel = 601,
		maxlevel = 750,
		multiplier = 25,
	},
	{
		minlevel = 751,
		maxlevel = 850,
		multiplier = 15,
	},
	{
		minlevel = 851,
		maxlevel = 1000,
		multiplier = 10,
	},
	{
		minlevel = 1001,
		maxlevel = 1300,
		multiplier = 4,
	},

	{
		minlevel = 1301,
		multiplier = 2,
	},
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 30,--30
	},
	{
		minlevel = 61,
		maxlevel = 80,
		multiplier = 15,--15
	},
	{
		minlevel = 81,
		maxlevel = 100,
		multiplier = 7,--7
	},
	{
		minlevel = 101,
		maxlevel = 124,
		multiplier = 4,--4
	},
	{
		minlevel = 125,
		multiplier = 2,--2
	},
}

magicLevelStages = {
		{
		minlevel = 0,
		maxlevel = 50,
		multiplier = 5,--7
	},
	{
		minlevel = 51,
		maxlevel = 80,
		multiplier = 30,--30
	},
	{
		minlevel = 81,
		maxlevel = 100,
		multiplier = 15,--15
	},
	{
		minlevel = 101,
		maxlevel = 125,
		multiplier = 7,--7
	},
	{
		minlevel = 125,
		maxlevel = 130,
		multiplier = 4,--4
	},
	{
		minlevel = 131,
		multiplier = 2,--2
	},
}
