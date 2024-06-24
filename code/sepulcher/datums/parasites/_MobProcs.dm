/mob/living/carbon/proc/HasParasite(datum/parasite/P)
	for(var/thing in parasites)
		var/datum/parasite/PP = thing
		if(P.IsSame(PP))
			return TRUE
	return FALSE

/mob/living/carbon/proc/CanContractParasite(datum/parasite/P)
	if(stat == DEAD)
		return FALSE

	if(P.GetParasiteID() in parasite_resistances)
		return FALSE

	if(HasParasite(P))
		return FALSE

	for(var/thing in P.required_limbs)
		if(!((locate(thing) in bodyparts)))
			return FALSE
	return TRUE

/mob/living/carbon/proc/ContractParasite(datum/parasite/P, target_zone)
	if(!CanContractParasite(P))
		return FALSE
	var/obj/item/bodypart/part_to_infect = target_zone
	P.attempt_infect(src, part_to_infect)

//Proc to use when you 100% want to try to infect someone (ignoreing protective clothing and such), as long as they aren't immune
/mob/living/carbon/proc/ForceContractParasite(datum/parasite/P, target_zone, make_copy = TRUE, del_on_fail = FALSE)
	if(!CanContractParasite(P))
		if(del_on_fail)
			qdel(P)
		return FALSE
	var/obj/item/bodypart/part_to_infect = target_zone
	if(!P.attempt_infect(src, part_to_infect, make_copy))
		if(del_on_fail)
			qdel(P)
		return FALSE
	return TRUE
