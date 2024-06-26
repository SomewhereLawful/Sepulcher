/datum/hud/constructs
	ui_style = 'icons/mob/screen/screen_construct.dmi'

/datum/hud/constructs/New(mob/owner)
	..()
	pull_icon = new /obj/screen/pull()
	pull_icon.icon = ui_style
	pull_icon.update_icon(mymob)
	pull_icon.screen_loc = ui_construct_pull
	static_inventory += pull_icon

	health = new /obj/screen/bar_stat/health/construct()
	infodisplay += health

/mob/living/simple_animal/hostile/construct/create_mob_hud()
	if(client && !hud_used)
		hud_used = new /datum/hud/constructs(src)
