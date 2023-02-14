/datum/species/kommandant
	name = "Kommandant"
	id = "kommandant"
	default_color = "FFFFFF"
	species_traits = list()
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	use_skintones = 0 // They all look like burnt corpses
	sexes = 0

/datum/species/kommandant/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()

	C.real_name = "The Kommandant"
	C.name = C.real_name // This is copied from Shadowpeople, could probably be made better
	if(C.mind)
		C.mind.name = C.real_name
	C.dna.real_name = C.real_name
