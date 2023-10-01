
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

	var/mob/living/carbon/affected_mob = null
	/// Areas this parasite will infect
	var/list/limbs_affecting = list(BODY_ZONE_CHEST)
	/// Can you give it to somebody else?
	var/transmittable = FALSE
	/// Does it spread to other bodyparts?
	var/body_spreading = FALSE
	/// Time per stage, in deciseconds. Slight variation with host health.
	var/stage_time = 3000
	var/list/infectable_biotypes = list(MOB_ORGANIC) // mostly redundancy since there may be mobs that are not organic
	var/process_dead = FALSE //if this ticks while the host is dead

//add this parasite if the host does not already have too many
/datum/parasite/proc/attempt_infect(var/mob/living/infectee, make_copy = TRUE)
	if(infectee.parasites.len < PARASITE_LIMIT)
		infect(infectee, make_copy)
		return TRUE
	return FALSE

// INVOKE THE PARASITE
/datum/parasite/proc/infect(var/mob/living/infectee, make_copy = TRUE)
	var/obj/item/bodypart/L = pick(limbs_affecting)
	if(L.parasites.len < LIMB_PARASITE_LIMIT) // Making sure there's space in a limb
		L.affecting_parasite += P


	var/datum/parasite/P = make_copy ? Copy() : src
	infectee.parasites += P

	P.affected_mob = infectee

	SSparasite.active_parasites += P //Add it to the active diseases list, now that it's actually in a mob and being processed.
	P.after_add()

// After infection, add stuff here that also happens to infectee that's out of the norm
/datum/parasite/proc/after_add()
	return