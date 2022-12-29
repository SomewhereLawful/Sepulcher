
// Spawners//

/obj/effect/mob_spawn/human/bioslave
	name = "enslaved birthing womb"
	desc = "Where all city-dwellers begin."
	icon = 'icons/obj/tuberculosis_spawners.dmi'
	icon_state = "bioslave"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	mob_species = /datum/species/bioslave
	flavour_text = null
	assignedrole = "Bioslave"

/obj/effect/mob_spawn/human/bioslave/special(mob/living/new_spawn)
	if(ishuman(new_spawn))
		var/mob/living/carbon/human/H = new_spawn
		H.underwear = "Nude"
		H.update_body()

/obj/effect/mob_spawn/human/prole
	name = "utilitarian birthing machine"
	desc = "Births Proletariat workers."
	icon = 'icons/obj/tuberculosis_spawners.dmi'
	icon_state = "prole"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	mob_species = /datum/species/proletariat
	flavour_text = null
	assignedrole = "Proletariat"

/obj/effect/mob_spawn/human/prole/special(mob/living/new_spawn)
	if(ishuman(new_spawn))
		var/mob/living/carbon/human/H = new_spawn
		H.underwear = "Nude"
		H.update_body()

/obj/effect/mob_spawn/human/kommandant
	name = "kommandant casket"
	desc = "Broken saintly flesh goes here to be reformed."
	icon = 'icons/obj/tuberculosis_spawners.dmi'
	icon_state = "kommandant"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	mob_species = /datum/species/pod // Kommandant later
	flavour_text = "You are not reborn, but rebuilt. The heavy clothes you wear are stitched to your inhuman body. You are this city's leader, their god and guide. Lead them well."
	assignedrole = "Kommandant"

/obj/effect/mob_spawn/human/kommandant/special(mob/living/new_spawn)
	if(ishuman(new_spawn))
		var/mob/living/carbon/human/H = new_spawn
		H.underwear = "Nude"
		H.update_body()
