// Will Procs
/mob/living/proc/getWill()
	return will

/mob/living/proc/adjustWill(amount, updating_will = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	will = CLAMP((will + (amount * CONFIG_GET(number/damage_multiplier))), 0, maxWill * 2)
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
	hunger = CLAMP((hunger + (amount * CONFIG_GET(number/damage_multiplier))), 0, maxHunger * 2)
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
	toxicity = CLAMP((toxicity + (amount * CONFIG_GET(number/damage_multiplier))), 0, maxToxicity * 2)
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
