// Health Procs
/mob/living/proc/getHealth()
	return health

/mob/living/proc/adjustHealth_stat(amount, updating_health = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	health = CLAMP((health + (amount)), 0, maxHealth)
	if(updating_health)
		updatehealth()
	return amount

/mob/living/proc/setHealth(amount, updating_health = TRUE, forced = FALSE)
	if(status_flags & GODMODE)
		return 0
	health = amount
	if(updating_health)
		updatehealth()
	return amount

// Will Procs
/mob/living/proc/getWill()
	return will

/mob/living/proc/adjustWill(amount, updating_will = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	will = CLAMP((will + (amount)), 0, maxWill)
	if(updating_will)
		updatewill()
	return amount

/mob/living/proc/setWill(amount, updating_will = TRUE, forced = FALSE)
	if(status_flags & GODMODE)
		return 0
	will = amount
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
/mob/living/proc/getToxicity()
	return toxicity

/mob/living/proc/adjustToxicity(amount, updating_toxicity = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	toxicity = CLAMP((toxicity + (amount)), 0, maxToxicity)
	if(updating_toxicity)
		updatetoxicity()
	return amount

/mob/living/proc/setToxicity(amount, updating_toxicity = TRUE, forced = FALSE)
	if(status_flags & GODMODE)
		return 0
	toxicity = amount
	if(updating_toxicity)
		updatetoxicity()
	return amount
