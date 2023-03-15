
/datum/hud/blobbernaut/New(mob/owner)
	..()

	blobpwrdisplay = new /obj/screen/bar_stat/health/blob/naut/core()
	infodisplay += blobpwrdisplay

	health = new /obj/screen/bar_stat/health/blob/naut()
	infodisplay += health

/mob/living/simple_animal/hostile/blob/blobbernaut/create_mob_hud()
	if(client && !hud_used)
		hud_used = new /datum/hud/blobbernaut(src)
