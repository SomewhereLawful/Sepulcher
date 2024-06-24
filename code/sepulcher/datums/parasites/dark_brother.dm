/datum/parasite/dark_brother
	name = "dark brother"
	desc = "Shared madness. Our dark brother, wrapped in white."
	required_limbs = list(/obj/item/bodypart/head)
	max_stages = 5

/datum/parasite/dark_brother/stage_act() //Removed toxloss because damaging diseases are pretty horrible. Last round it killed the entire station because the cure didn't work -- Urist -ACTUALLY Removed rather than commented out, I don't see it returning - RR
	..()

	switch(stage)
		if(3)
			if(prob(2))
				affected_mob.emote("blink")
			if(prob(2))
				affected_mob.emote("yawn")
			if(prob(2))
				to_chat(affected_mob, "<span class='danger'>You don't feel like yourself.</span>")
			if(prob(5))
				affected_mob.adjustBrainLoss(1, 170)
				affected_mob.updatehealth()
		if(4)
			if(prob(2))
				affected_mob.emote("stare")
			if(prob(2))
				affected_mob.emote("drool")
			if(prob(10))
				affected_mob.adjustBrainLoss(2, 170)
				affected_mob.updatehealth()
				if(prob(2))
					to_chat(affected_mob, "<span class='danger'>Your try to remember something important...but can't.</span>")

		if(5)
			if(prob(2))
				affected_mob.emote("stare")
			if(prob(2))
				affected_mob.emote("drool")
			if(prob(15))
				affected_mob.adjustBrainLoss(3, 170)
				affected_mob.updatehealth()
				if(prob(2))
					to_chat(affected_mob, "<span class='danger'>Strange buzzing fills your head, removing all thoughts.</span>")
			if(prob(3))
				to_chat(affected_mob, "<span class='danger'>You lose consciousness...</span>")
				affected_mob.visible_message("<span class='warning'>[affected_mob] suddenly collapses</span>")
				affected_mob.Unconscious(rand(100,200))
				if(prob(1))
					affected_mob.emote("snore")
			if(prob(15))
				affected_mob.stuttering += 3

	return
