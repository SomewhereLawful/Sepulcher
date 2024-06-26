/datum/hud/larva
	ui_style = 'icons/mob/screen/screen_alien.dmi'

/datum/hud/larva/New(mob/owner)
	..()
	var/obj/screen/using

	using = new /obj/screen/act_intent/alien()
	using.icon_state = mymob.a_intent
	static_inventory += using
	action_intent = using

	health = new /obj/screen/bar_stat/health/alien()
	infodisplay += health

	alien_queen_finder = new /obj/screen/alien/alien_queen_finder()
	infodisplay += alien_queen_finder
	pull_icon = new /obj/screen/pull()
	pull_icon.icon = 'icons/mob/screen/screen_alien.dmi'
	pull_icon.update_icon(mymob)
	pull_icon.screen_loc = ui_pull_resist
	hotkeybuttons += pull_icon

	zone_select = new /obj/screen/zone_sel/alien()
	zone_select.update_icon(mymob)
	static_inventory += zone_select

/mob/living/carbon/alien/larva/create_mob_hud()
	if(client && !hud_used)
		hud_used = new /datum/hud/larva(src)
