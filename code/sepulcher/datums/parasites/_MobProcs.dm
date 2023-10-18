
/mob/living/proc/HasParasite(datum/parasite/P)
	for(var/thing in parasites)
		var/datum/parasite/PP = thing
		if(P.IsSame(PP))
			return TRUE
	return FALSE

/mob/living/proc/CanContractParasite(datum/parasite/P)
	if(stat == DEAD)
		return FALSE

	if(HasParasite(P))
		return FALSE

	var/can_infect = FALSE
	for(var/host_type in P.infectable_biotypes)
		if(host_type in mob_biotypes)
			can_infect = TRUE
			break
	if(!can_infect)
		return FALSE

	if(!(type in P.viable_mobtypes))
		return FALSE

	return TRUE

/mob/living/proc/ContactContractParasite(datum/parasite/P)
	if(!CanContractParasite(P))
		return FALSE
	P.attempt_infect(src)