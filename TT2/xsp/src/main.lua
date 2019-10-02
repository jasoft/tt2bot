require 'maps'
require 'utils'


appid="com.gamehivecorp.taptitans2"
local SHORT_DELAY=500
local LONG_DELAY=2000
GAMESETTINGS={
	prestigeInterval=45,
	levelupArtifacts=false,
	noLevelupAtStartup=false,
	useSkills={}	
}


--AA buff points iterator
function buffpoints(maxcount, currentNumber)
	local arrX={100,200,700,800}
	if currentNumber<maxcount then
		currentNumber=currentNumber+1
		return currentNumber,arrX[math.modf((currentNumber-1)/(maxcount/4))+1],500+100*((currentNumber-1)%(maxcount/4))
	end
end

function tap(x,y)
	touchDown(1,x,y)
	mSleep(50)
	touchUp(1,x,y)
end

function beforeTap()
	
end

function tapw(point, times, interval, skipColor)
	times=times or 1
	interval=interval or 200
	for i=1,times do
		if(skipColor==nil) or ((skipColor~=nil) and (not isPointSimilarColor(point,skipColor,95))) then
			tap(point[1],point[2])
			mSleep(interval)
		else
			sysLog(("Skipped clicking on %d,%d"):format(point[1],point[2]))
		end
	end
end


function swipeUp(speed)
	touchDown(1, 320, 700)
	for i = 0, 200, speed do   --使用for循环连续滑动
		touchMove(1, 320, 700-i); 
		mSleep(50);        --延迟
	end
	touchUp(1, 320, 200)
end

function swipeDown(speed)
	touchDown(1, 320, 200)
	for i = 0, 200, speed do   --使用for循环连续滑动
		touchMove(1, 320, 500+i); 
		mSleep(50);        --延迟
	end
	touchUp(1, 320, 700)
end

function scrollToTop()
	for i=1,7 do
		swipeDown(100)
		mSleep(1000)
	end
end

function scrollToBottom()
	for i=1,7 do
		swipeUp(100)
		mSleep(1000)
	end
end

function launchApp()
	runApp(appid)
	init(appid,0)
end

function closeAllMenus()
	tapw(GAME_LOCS.PANELS.close_top)
	tapw(GAME_LOCS.PANELS.close_bottom)
	waitForAnimation()
end

--===============================================--
--game task functions start
--===============================================--
function levelupHeroes(fully)
	sysLog("Leveling up heroes")
	closeAllMenus()
	castSkills()
	tapw(GAME_LOCS.BOTTOM_BAR.heroes,1,1000)
	
	local total=1
	
	if fully then 
		total=20 
		scrollToBottom()
	else 
		total=1 
	end

	
	for i=1,total do
		swipeDown(50)
		for _,v in pairs(HEROES_LOCS.level_heroes) do
			tapw(v,1,50)
		end
	end
		
	if fully then scrollToTop() end
	closeAllMenus()
end

function levelupSword()
	closeAllMenus()
	tapw(GAME_LOCS.BOTTOM_BAR.master,1,1000)
	tapw(MASTER_LOCS.master_level)
	levelupSkills()
	closeAllMenus()
end

function levelupSkills()
	function levelToMax(skillname)
		tapw(MASTER_LOCS.skills[skillname],31,100)
--		mSleep(500)
--		if(not isPointSimilarColor(MASTER_LOCS.skills[skillname],GAME_COLORS.MAX,95)) then
--			tapw(MASTER_LOCS.skill_level_max[skillname])
--		end
	end

	levelToMax("heavenly_strike")
	levelToMax("deadly_strike")
	levelToMax("hand_of_midas")
	levelToMax("fire_sword")
	levelToMax("war_cry")
	levelToMax("shadow_clone")
	mSleep(2000)
end

function spamclicks()
	if(cannotPush()) then
		tapw(GAME_LOCS.GAME_SCREEN.fight_boss)
	end	
	sysLog("Clicking everywhere")
	table.foreach(GAME_LOCS.GAME_SCREEN.fairies_map, function(i,v) tapw(v,1,0) end)
	tapw(GAME_LOCS.AD.collect_ad)
	tapw(GAME_LOCS.EGGS.hatch_egg)
	castSkills()
end

function castSkills()
	sysLog("Casting skills")
	closeAllMenus()
	table.foreach(GAMESETTINGS.useSkills, function(i,v) 
		print("Casting "..v)
		tapw(GAME_LOCS.SKILL_BAR[v]) 
		end
	)
	tapw(GAME_LOCS.GAME_SCREEN.call_hero)
end

function runTask(func, duration) --in seconds
    local init = os.time()
    local diff=os.difftime(os.time(),init)
    while diff<duration do
        func()
        sysLog(diff)
		diff=os.difftime(os.time(),init)
	end
end

function cannotPush()
	r= isPointSimilarColor({GAME_COLORS.fight_boss[1],GAME_COLORS.fight_boss[2]},
		GAME_COLORS.fight_boss[3],100)
	if r then
		sysLog("can not go forward, prestige.")
		return r
	end
end

function prestige()
	closeAllMenus()
	tapw(GAME_LOCS.BOTTOM_BAR.master)
	scrollToBottom()
	mSleep(2000)
	tapw(MASTER_LOCS.prestige,1,1000)
	tapw(MASTER_LOCS.prestige_confirm,1,1000)
	tapw(MASTER_LOCS.prestige_final,1,1000)
	mSleep(30000)
	GAMESETTINGS.noLevelupAtStartup=false
	initGame()
	if(GAMESETTINGS.levelupArtifacts) then
		levelupArtifacts()
	end
	
end

function levelupArtifacts()
	closeAllMenus()
	tapw(GAME_LOCS.BOTTOM_BAR.artifacts,1,1000)
	tapw(ARTIFACTS_LOCS.bos)
	closeAllMenus()
end

local initTime=os.time()
local hudId = createHUD()     --创建一个HUD
local lastStatusText=""
function showStatusBar(text)
	if text==lastStatusText then return end
	coord=STATS_COORDS.hud_status
	showHUD(hudId,text,12,"0xffff0000","0xffffffff",0,coord[1],coord[2],coord[3]-coord[1],coord[4]-coord[2])      --显示HUD内容
	lastStatusText=text
end

function collapseMenu()
	if getColor(GAME_LOCS.PANELS.expand_collapse_bottom[1],GAME_LOCS.PANELS.expand_collapse_bottom[2])==GAME_COLORS.uparrow then
		tapw(GAME_LOCS.PANELS.expand_collapse_bottom,1,2000)
	end
end

function initGame()
	initTime=os.time()
	sysLog("Initialize game")
	closeAllMenus()
	local c=GAME_COLORS.skill_exists
	local bExistingGame=isPointSimilarColor({c[1],c[2]},c[3],100) 

	tapw(GAME_LOCS.BOTTOM_BAR.master,1,1000)
	collapseMenu()
	
	if not bExistingGame then
		sysLog("Fresh game")
		scrollToTop()
		levelupSword()
	end
	levelupHeroes(true)
end

--===============================================--
--game task functions end
--===============================================--
function waitForAnimation()
	mSleep(1000)
end

function loadSettings(results)
	if(results.txtPrestige~=nil) then
		GAMESETTINGS.prestigeInterval=tonumber(results.txtPrestige)

	end
	useSkills=split(results.cbgSkills,"@")	--0@3@5 like data format
	for i,v in pairs(useSkills) do
		table.insert(GAMESETTINGS.useSkills, SKILLS[v+1])
	end
	options=split(results.cbgOptions,"@")
	table.foreach(options,
		function(i,v)
			if(v=="5") then
				GAMESETTINGS.levelupArtifacts=true
			end
			if(v=="0") then
				GAMESETTINGS.noLevelupAtStartup=true
			end

		end
	)
	table.print(GAMESETTINGS)
end


function main()
	ret,results=showUI("ui.json")
	if ret==0 then return end
	loadSettings(results)
	
	launchApp()
	mSleep(3000)
	if(GAMESETTINGS.noLevelupAtStartup==false) then 
		initGame()
	end
	while(true) do
		local diff=os.difftime(os.time(),initTime)
		local runMinutes=diff/60
		showStatusBar(("Running %d of %d minutes."):format(runMinutes,GAMESETTINGS.prestigeInterval))
		if(runMinutes>GAMESETTINGS.prestigeInterval) then prestige() end
		castSkills()
		levelupHeroes(false)
		runTask(spamclicks,45)
	end
end

main()