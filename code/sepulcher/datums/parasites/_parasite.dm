
// A code hodgepodge (shitheap) of diseases, embedded objects, and mutations
// Coder discretion and holy water is advised

// One per limb, one for head and one for torso
#define PARASITE_LIMIT 6
// One parasite per limb, no roommates
#define LIMB_PARASITE_LIMIT 1

// Parasites
/datum/parasite
	var/name = "black empty"
	var/desc = "The null void in us all."
	var/examine_hint = "Their eyes are glassy, their flesh rotten. Nothing out of the normal, then."

	//Stages
	var/stage = 1
	var/max_stages = 0
	var/stage_prob = 4

	var/list/viable_mobtypes = list() //typepaths of viable mobs
	var/mob/living/carbon/affected_mob = null
	/// Bodyparts this parasite will infect
	var/list/limbs_affecting = list(BODY_ZONE_CHEST)
	/// Can you give it to somebody else?
	var/transmittable = FALSE
	/// Does it spread to other bodyparts?
	var/body_spreading = FALSE
	/// Time per stage, in deciseconds. Slight variation with host health.
	var/curable = TRUE
	/// Time per stage, in deciseconds. Slight variation with host health.
	var/cure_chance = 8
	var/stage_time = 3000
	var/list/infectable_biotypes = list(MOB_ORGANIC) // mostly redundancy since there may be mobs that are not organic
	var/process_dead = FALSE //if this ticks while the host is dead, good for stuff like corpseworms

//add this parasite if the host does not already have too many
/datum/parasite/proc/attempt_infect(mob/living/infectee)
	if(infectee.parasites.len < PARASITE_LIMIT)
		infect(infectee)
		return TRUE
	return FALSE

// INVOKE THE PARASITE
/datum/parasite/proc/infect(mob/living/infectee)
	// declare the vars
//	var/missing_limbs = infectee.get_missing_limbs()
	var/datum/parasite/P = src
	var/obj/item/bodypart/L = pick(limbs_affecting)
	// ensure we can infect this fool
	if(!limbs_affecting)
		return
	if(L.affecting_parasite.len < LIMB_PARASITE_LIMIT) // Making sure there's space in a limb
		L.affecting_parasite += P

	// Infect
	infectee.parasites += P
	P.affected_mob = infectee
	P.after_add()
	SSparasite.active_parasites += P //Add it to the active diseases list, now that it's actually in a mob and being processed.


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
	if(curable == TRUE)
		return FALSE

/datum/parasite/proc/cure()
	qdel(src)