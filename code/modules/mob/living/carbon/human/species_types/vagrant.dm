/datum/species/vagrant
	name = "Vagrant"
	id = "vagrant"
	default_color = "FFFFFF"
	species_traits = list(NO_UNDERWEAR)
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	use_skintones = 0 // They all look like burnt corpses
	skinned_type = /obj/item/stack/sheet/animalhide/human
	sexes = 0

/datum/species/vagrant/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()

	C.real_name = "[pick(GLOB.vagrant_synonym)]"
	C.name = C.real_name
	if(C.mind)
		C.mind.name = C.real_name
	C.dna.real_name = C.real_name
