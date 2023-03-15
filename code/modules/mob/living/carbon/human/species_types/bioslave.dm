/datum/species/bioslave
	name = "Bioslave"
	id = "bioslave"
	default_color = "FFFFFF"
	species_traits = list(LIPS,NO_UNDERWEAR)
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	use_skintones = 0 // They all look like burnt corpses
	skinned_type = /obj/item/stack/sheet/animalhide/human
	no_equip = list(SLOT_WEAR_MASK, SLOT_WEAR_SUIT, SLOT_GLOVES, SLOT_SHOES, SLOT_S_STORE, SLOT_EARS, SLOT_NECK)
	nojumpsuit = 1
	sexes = 0

/datum/species/bioslave/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()

	C.real_name = "[pick(GLOB.bioslave_first)] [pick(GLOB.bioslave_synonym)]"
	C.name = C.real_name // This is copied from Shadowpeople, could probably be made better
	if(C.mind)
		C.mind.name = C.real_name
	C.dna.real_name = C.real_name
