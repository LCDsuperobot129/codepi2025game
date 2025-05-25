local CalculateStats = {}

local cachedLevels = {}

local exponent = 1.8
local mult = 100

local function expFormula(level: number)
	
	local exp = level ^ exponent
	exp = exp * mult
	exp = math.floor(exp/5) * 5
	
	cachedLevels[level] = exp
	
	return exp
end

local function levelFormula(exp: number)
	
	local level = exp / mult
	level = level ^ (1 / exponent)
	level = math.floor(level)
	
	return level
end


function CalculateStats.FromLevel(level: number)
	
	local exp
	
	if not cachedLevels[level] then
		exp = expFormula(level)
		
	else
		exp = cachedLevels[level]
	end
	
	return exp
end

function CalculateStats.FromExp(exp: number)
	
	local level
	
	for cachedLevel, cachedExp in pairs(cachedLevels) do
		
		if cachedExp < exp and (not level or cachedLevels[level] < cachedExp) then
			level = cachedLevel
		end
	end
		
	if not level then
		level = levelFormula(exp)
	end
	
	return level
end


return CalculateStats
