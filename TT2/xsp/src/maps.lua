-- All points in game that are relevant to the given resolution can be stored here.
-- Not all locations need to be stored here, only locations that otherwise would be
-- more of an issue trying to click on after looking for a different image.
GAME_LOCS = {
    DAILY_REWARD = {
        open_rewards = {34, 175},
        close_rewards = {430, 225},
        collect_rewards = {240, 525}
    },
    BOTTOM_BAR = {
        equipment = {200, 780},
        master = {39, 780},
        heroes = {120, 780},
        shop = {442, 780},
        pets = {281, 780},
        artifacts = {362, 780}
    },
    EMULATOR = {
        back_emulator = {504, 698}, 
        exit_emulator = {468, -19}, 
        restart_emulator = {300, 438}
    },
    AD = {
        collect_ad = {365, 615}, 
        collect_ad_after_watch = {256, 600}, 
        no_thanks = {135, 615}
    },
    SKILL_BAR = {
        hand_of_midas = {200, 709},
        fire_sword = {283, 709},
        shadow_clone = {444, 709},
        heavenly_strike = {43, 709},
        deadly_strike = {123, 709},
        war_cry = {363, 709}
    },
    EGGS = {
        hatch_egg = {35, 280}
    },
    GAME_SCREEN = {
        scroll_quick_stop = {328, 745},
        clan_ship = {60, 153},
        fight_boss = {425, 30},
        pet_gold = {287, 376},
        clan_crate = {70, 130},
        player = {235, 386},
        scroll_start = {328, 495},
        scroll_top_end = {328, 730},
        scroll_bottom_end = {328, 45},
        game_middle = {250, 285},
        fairies_map = {
			--AA
			{15,179},
            {75, 90},
            {100, 90},
            {140, 90},
            {200, 90},
            {260, 90},
            {320, 90},
            {380, 90},
            {440, 90},
            {75, 125},
            {100, 125},
            {140, 125},
            {200, 125},
            {260, 125},
            {320, 125},
            {380, 125},
            {440, 125},
            {75, 195},
            {100, 195},
            {140, 195},
            {200, 195},
            {260, 195},
            {320, 195},
            {380, 195},
            {440, 195},
            {75, 265},
            {100, 265},
            {140, 265},
            {200, 265},
            {260, 265},
            {320, 265},
            {380, 265},
            {440, 265},
            {75, 335},
            {100, 335},
            {140, 335},
            {200, 335},
            {260, 335},
            {320, 335},
            {380, 335},
            {440, 335},
            {75, 405},
            {100, 405},
            {140, 405},
            {200, 405},
            {260, 405},
            {320, 405},
            {380, 405},
            {440, 405},
            {285, 365},
            {110, 410},
            {355, 410}
        },
        pet_attack = {235, 342},
		call_hero =  {175, 410},

		
    },
    PANELS = {
        expand_collapse_top = {386, 8},
        close_bottom = {449, 444},
        close_top = {449, 8},
        expand_collapse_bottom = {386, 443}
    },
    ARTIFACTS = {
		bottom_region = {2, 692, 440, 762}
	},
    TOURNAMENT = {
        tournament_prestige = {330, 535},
        collect_prize = {245, 730},
        tournament = {30, 70},
        join = {245, 695}
    },
    CLAN = {
        clan_info_close = {408, 62},
        clan = {82, 24},
        clan_results_copy = {80, 227},
        clan_raid = {109, 715},
        clan_info = {392, 123},
        clan_results = {267, 118}
    }
}
MASTER_LOCS = {
    prestige_confirm = {245, 625},
    screen_top = {240, 5},
    master_level = {415, 135},
    prestige = {405, 735},
    skill_level_max = {
        hand_of_midas = {268, 398},
        fire_sword = {268, 473},
        shadow_clone = {268, 624},
        heavenly_strike = {268, 245},
        deadly_strike = {268, 322},
        war_cry = {268, 549}
    },
    daily_achievements = {342, 88},
    skills = {
        hand_of_midas = {415, 388},
        fire_sword = {415, 465},
        shadow_clone = {415, 618},
        heavenly_strike = {415, 235},
        deadly_strike = {415, 315},
        war_cry = {415, 540}
    },
    achievements = {207, 502},
    prestige_final = {330, 535}
}
HEROES_LOCS = {
    level_heroes = {
        {405, 735},
        {405, 655},
        {405, 580},
        {405, 505},
        {405, 430},
        {405, 355},
        {405, 275},
        {405, 205},
        {405, 125},
        {405, 50}
    },
    stats_expanded = {135, 70},
    drag_heroes = {
        dragstart = {328, 50}, 
        dragend = {328, 885}
    },
    stats_collapsed = {135, 505}
}
ARTIFACTS_LOCS = {
	bos={ 401, 238},
    buy_multiplier = {410, 70},
    buy_max = {50, 70},
    artifact_push = {20, 340},
    percent_toggle = {303, 505}
}


-- Store any colors used {RGB} by the bot to determine so things in game.
GAME_COLORS = {
	WHITE= {255, 255, 255},
	fight_boss={366,16,0xb7440a},
	skill_exists={68,708,0xffffff},
	uparrow=0x544c4c,
	MAX=0x939393,
}


-- All coordinates mapped to their respective resolutions for grabbing
-- each stat image that will be parsed by pytesseract.
STATS_COORDS = {
	highest_stage_reached= {55, 474, 430, 495},
	total_pet_level= {55, 495, 430, 515},
	gold_earned= {55, 516, 430, 536},
	taps= {55, 537, 430, 561},
	titans_killed= {55, 559, 430, 579},
	bosses_killed= {55, 580, 430, 600},
	critical_hits= {55, 602, 430, 621},
	chestersons_killed= {55, 623, 430, 643},
	prestiges= {55, 645, 430, 666},
	days_since_install= {55, 670, 430, 686},
	play_time= {55, 687, 430, 708},
	relics_earned= {55, 709, 430, 729},
	fairies_tapped= {55, 731, 430, 751},
	daily_achievements= {55, 750, 430, 773},
	hud_status={0,435,145,457},
}

STAGE_COORDS = {
	region= {214, 71, 268, 84},
}

PRESTIGE_COORDS = {
	time_since= {300, 614, 360, 628},
	advance_start= {145, 557, 202, 577},
}

-- The regions for each skill present on the master screen if the panel
-- is expanded and scrolled all the way to the top.
MASTER_COORDS = {
	skills= {
		heavenly_strike= {0, 233, 480, 303},
		deadly_strike= {0, 309, 480, 380},
		hand_of_midas= {0, 385, 480, 455},
		fire_sword= {0, 460, 480, 531},
		war_cry= {0, 536, 480, 607},
		shadow_clone= {0, 612, 480, 682},
	},
}

CLAN_COORDS = {
	info_name= {133, 70, 362, 103},
	info_code= {123, 730, 172, 745},
}

-- Clan raid coordinates located in the main clan raid page.
CLAN_RAID_COORDS = {
	raid_attack_reset= {55, 753, 240, 771},
}

-- Set of skills in game.
SKILLS = {
	"heavenly_strike",
	"deadly_strike",
	"hand_of_midas",
	"fire_sword",
	"war_cry",
	"shadow_clone"
}
