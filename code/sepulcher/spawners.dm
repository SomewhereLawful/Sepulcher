
// Spawners//

/obj/effect/mob_spawn/human/bioslave
	name = "enslaved birthing womb"
	desc = "Where all city-dwellers begin."
	icon = 'icons/obj/spawners.dmi'
	icon_state = "bioslave"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	uses = -1
	mob_gender = MALE
	mob_species = /datum/species/bioslave
	flavour_text = "<span class='danger'><b>Birthed whole, you awake from dreams of soft, undefiled life. You are little more than rough, callous flesh without purpose. Get to carting shit and scrap metal.</b></span>"
	assignedrole = "Bioslave"

	uniform = /obj/item/clothing/under/pants/bioslave_rags

/obj/effect/mob_spawn/human/prole
	name = "utilitarian birthing machine"
	desc = "Births Proletariat workers."
	icon = 'icons/obj/spawners.dmi'
	icon_state = "prole"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	uses = -1
	mob_gender = MALE
	mob_species = /datum/species/proletariat
	flavour_text = "<span class='danger'><b>Proving you're capable of carting shit and scrap metal, you are now one of the city's rank and file proletariat. You can do more mentally challenging work without dying immediately.</b></span>"
	assignedrole = "Proletariat"

/obj/effect/mob_spawn/human/bougie
	name = "embraced birth casket"
	desc = "Reforms Bourgeoise, those without taint of body."
	icon = 'icons/obj/spawners.dmi'
	icon_state = "prole"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	uses = -1
	mob_species = /datum/species/human
	flavour_text = "<span class='danger'><b>You are the few of a dead breed. Without bodily taint, you have shed sin and live now as the city's high caste responsible for export and fine art.</b></span>"
	assignedrole = "Bourgeoise"

/obj/effect/mob_spawn/human/kommandant
	name = "kommandant casket"
	desc = "Broken saintly flesh goes here to be reformed."
	icon = 'icons/obj/spawners.dmi'
	icon_state = "kommandant"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	uses = -1
	mob_gender = MALE
	mob_species = /datum/species/kommandant
	flavour_text = "<span class='danger'><b>You are rebuilt flesh of saints. Your duty is to the people; ascention and guidance are in your hands. Your word is law, your will manifest.</b></span>"
	assignedrole = "Kommandant"

	head = /obj/item/clothing/head/kommandant
	mask = /obj/item/clothing/mask/gas/kommandant
	uniform = /obj/item/clothing/under/kommandant
	shoes = /obj/item/clothing/shoes/kommandant
	suit = /obj/item/clothing/suit/armor/kommandant
	gloves = /obj/item/clothing/gloves/kommandant
