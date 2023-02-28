/mob/living/proc/adjustwillstat(amount, updatewill = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	will = will + (amount)
	if(updatewill)
		updatewill()
	return amount