/datum/parasite/corpse_worms
	name = "corpse worms"
	desc = "Worms under your skin, flexing - biting."
	required_limbs = list(/obj/item/bodypart/l_arm, /obj/item/bodypart/r_arm, /obj/item/bodypart/l_leg, /obj/item/bodypart/r_leg)
	body_spreading = TRUE
	process_dead = TRUE
	max_stages = 3

/datum/parasite/corpse_worms/stage_act()
	..()

	switch(stage)
		if(1)
			if(prob(2))
				to_chat(affected_mob, "<span class='red'>You feel something beneath your skin...</span>")
			if(prob(5))
				affected_mob.adjustBruteLoss(1, 170)
				affected_mob.updatehealth()
		if(2)
			if(prob(2))
				to_chat(affected_mob, "<span class='red'>You absentmindedly being to itch at yourself.</span>")
				affected_mob.visible_message("<span class='red'>[affected_mob] itches at themselves.</span>")
			if(prob(10))
				affected_mob.adjustBruteLoss(2, 170)
				affected_mob.updatehealth()
				if(prob(2))
					to_chat(affected_mob, "<span class='red'>You feel like something bit you.</span>")
		if(3)
			if(prob(15))
				affected_mob.adjustBruteLoss(3, 170)
				affected_mob.updatehealth()
				if(prob(2))
					to_chat(affected_mob, "<span class='red'>Something beneath your skin is biting you.</span>")
			if(prob(3))
				to_chat(affected_mob, "<span class='red'>Something writhes beneath your skin...</span>")

	return