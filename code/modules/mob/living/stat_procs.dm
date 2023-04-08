// Health Procs
/mob/living/proc/getHealth()
	return health

// Will Procs
/mob/living/proc/getWillLoss()
	return willloss

/mob/living/proc/adjustWillLoss(amount, updating_will = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	willloss = CLAMP((willloss + (amount)), 0, maxWill)
	if(updating_will)
		updatewill()
	return amount

/mob/living/proc/setWillLoss(amount, updating_will = TRUE, forced = FALSE)
	if(status_flags & GODMODE)
		return 0
	willloss = amount
	if(updating_will)
		updatewill()
	return amount

// Hunger Procs
/mob/living/proc/getHunger()
	return will

/mob/living/proc/adjustHunger(amount, updating_hunger = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	hunger = CLAMP((hunger + (amount)), 0, maxHunger)
	if(updating_hunger)
		updatehunger()
	return amount

/mob/living/proc/setHunger(amount, updating_hunger = TRUE, forced = FALSE)
	if(status_flags & GODMODE)
		return 0
	hunger = amount
	if(updating_hunger)
		updatehunger()
	return amount

// Toxicity procs
/mob/living/proc/getToxicityGain()
	return toxicitygain

/mob/living/proc/adjustToxicityGain(amount, updating_toxicity = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	toxicitygain = CLAMP((toxicitygain + (amount)), 0, maxToxicity)
	if(updating_toxicity)
		updatetoxicity()
	return amount

/mob/living/proc/setToxicityGain(amount, updating_toxicity = TRUE, forced = FALSE)
	if(status_flags & GODMODE)
		return 0
	toxicitygain = amount
	if(updating_toxicity)
		updatetoxicity()
	return amount
