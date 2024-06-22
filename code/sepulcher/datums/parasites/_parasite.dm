// One per limb, one for head and one for torso
#define PARASITE_LIMIT 6
// One parasite per limb, no roommates
#define LIMB_PARASITE_LIMIT 1

// Parasites
/datum/parasite
	var/name = "black empty"
	var/desc = "The null void in us all."
	var/examine_hint = "Their eyes are glassy, their flesh rotten. Nothing out of the normal, then."
	var/obj/item/parasite_item = null // If the parasite has an item version

	//Stages
	var/stage = 1
	var/max_stages = 0
	var/stage_prob = 4
	var/stage_time = 3000

	var/mob/living/carbon/affected_mob = null
	/// Bodyparts/organs this parasite can infect
	var/list/required_limbs = list()
	var/transmittable = FALSE
	/// Does it spread to other bodyparts?
	var/body_spreading = FALSE
	var/process_dead = FALSE //if this ticks while the host is dead, good for stuff like corpseworms
	var/curable = TRUE

	/// Time per stage, in deciseconds. Slight variation with host health.
	var/cure_chance = 8
	var/copy_type = null //if this is null, copies will use the type of the instance being copied

/datum/parasite/Destroy()
	. = ..()
	if(affected_mob)
		remove_parasite()
	SSparasite.active_parasites.Remove(src)

//add this parasite if the host does not already have too many
/datum/parasite/proc/attempt_infect(mob/living/carbon/infectee, /obj/item/bodypart/part_infecting, make_copy = TRUE)
	if(infectee.parasites.len <= PARASITE_LIMIT)
		infect(infectee, part_infecting, make_copy)
		return TRUE
	return FALSE

// INVOKE THE PARASITE
/datum/parasite/proc/infect(mob/living/carbon/infectee, /obj/item/bodypart/part_infecting, make_copy = TRUE)
	var/datum/parasite/P = make_copy ? Copy() : src

	for(part_infecting in infectee.bodyparts)
		part_infecting.affecting_parasite += P
	infectee.parasites += P
	P.affected_mob = infectee

	SSparasite.active_parasites += P //Add it to the active parasites list, now that it's actually in a mob and being processed.
	P.after_add()

/datum/parasite/proc/Copy()
	//note that stage is not copied over - the copy starts over at stage 1
	var/static/list/copy_vars = list("name", "desc", "examine_hint",
									"max_stages", "stage_prob", "stage_time",
									"required_limbs", "transmittable",
									"body_spreading", "process_dead",
									"curable", "cure_chance")

	var/datum/parasite/P = copy_type ? new copy_type() : new type()
	for(var/V in copy_vars)
		var/val = vars[V]
		if(islist(val))
			var/list/L = val
			val = L.Copy()
		P.vars[V] = val
	return P

// After infection, add stuff here that also happens to infectee that's out of the norm
/datum/parasite/proc/after_add()
	return

/datum/parasite/proc/IsSame(datum/parasite/P)
	if(istype(src, P.type))
		return TRUE
	return FALSE

/datum/parasite/proc/stage_act()
	var/cure = has_cure()
	stage = min(stage, max_stages)

	if(!cure)
		if(prob(stage_prob))
			stage = min(stage + 1,max_stages)
	else
		if(prob(cure_chance))
			stage = max(stage - 1, 1)

	if(curable == TRUE)
		if(cure && prob(cure_chance))
			cure()

//	for(var/thing in M.diseases)
//		var/datum/disease/D = thing
//		if(D.spread_flags & DISEASE_SPREAD_CONTACT_SKIN)
//			ContactContractDisease(D)

/datum/parasite/proc/has_cure()
	if(curable == FALSE)
		return FALSE

/datum/parasite/proc/cure()
	qdel(src)

/datum/parasite/proc/GetParasiteID()
	return "[type]"

/datum/parasite/proc/remove_parasite(/obj/item/bodypart/part_infected)
	if(part_infected)
		part_infected.affecting_parasite -= src
	affected_mob.parasites -= src		//remove the datum from the list
	affected_mob = null