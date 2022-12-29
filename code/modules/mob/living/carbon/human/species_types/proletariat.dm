/datum/species/proletariat
	name = "Proletariat"
	id = "proletariat"
	default_color = "FFFFFF"
	species_traits = list(LIPS)
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	use_skintones = 0 // They all look like burnt corpses
	skinned_type = /obj/item/stack/sheet/animalhide/human
	sexes = 0

	var/info_text = "Proving you're capable of carting shit and scrap metal, you are now on of the city's rank and file proletariat. You can do more mentally challenging work without dying immediately."

/datum/species/proletariat/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	to_chat(C, "[info_text]")

	C.real_name = "[pick(GLOB.prole_first)] [pick(GLOB.prole_synonym)]"
	C.name = C.real_name // This is copied from Shadowpeople, could probably be made better
	if(C.mind)
		C.mind.name = C.real_name
	C.dna.real_name = C.real_name
