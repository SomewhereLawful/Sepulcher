
/mob/living/proc/HasParasite(datum/parasite/P)
	for(var/thing in parasites)
		var/datum/parasite/PP = thing
		if(P.IsSame(PP))
			return TRUE
	return FALSE

/mob/living/proc/CanContractParasite(datum/parasite/P)
	if(stat == DEAD)
		return FALSE

	if(P.GetParasiteID() in parasite_resistances)
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

/mob/living/proc/ContractParasite(datum/parasite/P)
	if(!CanContractParasite(P))
		return FALSE
	P.attempt_infect(src)

/mob/living/carbon/ContractParasite(datum/parasite/P, target_zone)
	if(!CanContractParasite(P))
		return FALSE
	else
		P.attempt_infect(src)

//mob/living/proc/AirborneContractParasite(datum/parasite/P, force_spread)
//	if( ((D.spread_flags & DISEASE_SPREAD_AIRBORNE) || force_spread) && prob((50*D.permeability_mod) - 1))
//		ForceContractParasite(P)

//mob/living/carbon/AirborneContractParasite(datum/parasite/P, force_spread)
//	if(internal)
//		return
//	if(has_trait(TRAIT_NOBREATH))
//		return
//	..()

//Proc to use when you 100% want to try to infect someone (ignoreing protective clothing and such), as long as they aren't immune
/mob/living/proc/ForceContractParasite(datum/parasite/P, make_copy = TRUE, del_on_fail = FALSE)
	if(!CanContractParasite(P))
		if(del_on_fail)
			qdel(P)
		return FALSE
	if(!P.attempt_infect(src, make_copy))
		if(del_on_fail)
			qdel(P)
		return FALSE
	return TRUE

/mob/living/carbon/human/CanContractParasite(datum/parasite/P)
	for(var/thing in P.required_organs)
		if(!((locate(thing) in bodyparts) || (locate(thing) in internal_organs)))
			return FALSE
	return ..()