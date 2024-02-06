/datum/species/beater
	name = "Beater"
	id = "beater"
	default_color = "FFFFFF"
	species_traits = list(LIPS,NO_UNDERWEAR,NOEYES)
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	use_skintones = 0
	skinned_type = /obj/item/stack/sheet/animalhide/human
	sexes = 0

/datum/species/beater/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()

	C.gender = MALE
	C.real_name = "Hegemony Unit [rand(1,100)]"
	C.name = C.real_name // This is copied from Shadowpeople, could probably be made better
	if(C.mind)
		C.mind.name = C.real_name
	C.dna.real_name = C.real_name
