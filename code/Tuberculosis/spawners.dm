
// Spawners//

/obj/effect/mob_spawn/human/bioslave
	name = "enslaving birthing womb"
	desc = "Where all city-dwellers begin. Transposes souls from the dream and burdens them with reality, supposedly."
	icon = 'icons/obj/tuberculosis_spawners.dmi'
	icon_state = "bioslave"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	mob_species = /datum/species/pod // Bioslave later
	flavour_text = "Birthed whole, you awake from dreams of soft, undefiled life. You are little more than rough, callous flesh without purpose. Get to carting shit and scrap metal."
	assignedrole = "Bioslave"

/obj/effect/mob_spawn/human/bioslave/special(mob/living/new_spawn)
	if(ishuman(new_spawn))
		var/mob/living/carbon/human/H = new_spawn
		H.underwear = "Nude"
		H.update_body()
