// Procs related to blood_volume and limb bleed_rate
// This might need to be sorted/divided into other DMs in the future

/mob/living/proc/getBloodvolume()
	return blood_volume

/mob/living/proc/adjustBloodvolume(amount, updating_blood = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	blood_volume = max((blood_volume + (amount)), 0, maxblood_volume)
	if(updating_blood)
		updatebloodvolume()
	return amount

/mob/living/proc/setBloodvolume(amount, updating_blood = TRUE, forced = FALSE)
	if(status_flags & GODMODE)
		return 0
	blood_volume = amount
	if(updating_blood)
		updatebloodvolume()
	return amount

// Limb bleeding code - yes this is carbon
//Returns a list of damageable bodyparts
/mob/living/carbon/proc/get_bleeding_bodyparts()
	var/list/obj/item/bodypart/bleeding_parts = list()
	for(var/X in bodyparts)
		var/obj/item/bodypart/BP = X
		if(BP.bleed_rate)
			bleeding_parts += BP
	return bleeding_parts

// Bleed_rate procs
/obj/item/bodypart/proc/suppress_bloodloss(amount)
	if(bleed_suppressed)
		return
	else
		bleed_suppressed = TRUE
		addtimer(CALLBACK(src, .proc/resume_bleeding), amount)

/obj/item/bodypart/proc/resume_bleeding()
	bleed_suppressed = 0
	if(owner.stat != DEAD && bleed_rate)
		to_chat(src, "<span class='warning'>The blood soaks through your [name]'s bandage.</span>")
