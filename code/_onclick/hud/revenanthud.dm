
/datum/hud/revenant/New(mob/owner)
	..()

	health = new /obj/screen/bar_stat/health/revenant()
	infodisplay += health

/mob/living/simple_animal/revenant/create_mob_hud()
	if(client && !hud_used)
		hud_used = new /datum/hud/revenant(src)
