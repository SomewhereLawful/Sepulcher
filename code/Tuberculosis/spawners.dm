
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
	flavour_text = "<span class='danger'>Birthed whole, you awake from dreams of soft, undefiled life. You are little more than rough, callous flesh without purpose. Get to carting shit and scrap metal.</span>"
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
	flavour_text = "<span class='danger'>Proving you're capable of carting shit and scrap metal, you are now on of the city's rank and file proletariat. You can do more mentally challenging work without dying immediately.</span>"
	assignedrole = "Proletariat"

/obj/effect/mob_spawn/human/prole/special(mob/living/new_spawn)
	if(ishuman(new_spawn))
		var/mob/living/carbon/human/H = new_spawn
		H.underwear = "Nude"
		H.update_body()

/obj/effect/mob_spawn/human/bougie
	name = "embraced birth casket"
	desc = "Reforms Bourgeoise, those without taint of body."
	icon = 'icons/obj/tuberculosis_spawners.dmi'
	icon_state = "prole"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	mob_species = /datum/species/human
	flavour_text = "<span class='danger'>You are the few of a dead breed. Without bodily taint, you have shed sin and live now as the city's high caste responsible for export and fine art.</span>"
	assignedrole = "Bourgeoise"

/obj/effect/mob_spawn/human/bougie/special(mob/living/new_spawn)
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
	flavour_text = "<span class='danger'>You are not reborn, but rebuilt. The heavy clothes you wear are stitched to your inhuman body. You are this city's leader, their god and guide. Lead them well.</span>"
	assignedrole = "Kommandant"

/obj/effect/mob_spawn/human/kommandant/special(mob/living/new_spawn)
	if(ishuman(new_spawn))
		var/mob/living/carbon/human/H = new_spawn
		H.underwear = "Nude"
		H.update_body()
