// Procs related to blood_volume and limb bleed_rate
// This might need to be sorted/divided into other DMs in the future

/mob/living/proc/getBloodloss()
	return bloodloss

/mob/living/proc/adjustBloodloss(amount, updating_blood = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	bloodloss = CLAMP((bloodloss + (amount)), 0, maxblood_volume)
	if(updating_blood)
		updatebloodloss()
	return amount

/mob/living/proc/setBloodloss(amount, updating_blood = TRUE, forced = FALSE)
	if(status_flags & GODMODE)
		return 0
	bloodloss = amount
	if(updating_blood)
		updatebloodloss()
	return amount

// Bleed_rate procs
/obj/item/bodypart/proc/suppress_bloodloss(amount)
	if(bleed_suppressed)
		return
	else
		bleed_suppressed = TRUE
		addtimer(CALLBACK(src, .proc/resume_bleeding), amount)

/obj/item/bodypart/proc/resume_bleeding()
	bleed_suppressed = FALSE
	if(owner.stat != DEAD && bleed_rate)
		to_chat(src, "<span class='warning'>The blood soaks through your [name]'s bandage.</span>")
