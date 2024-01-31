//contents
// (1 - mob_spawn
// (2 - latejoin

// Spawners // (1
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
	flavour_text = ""
	assignedrole = "Proletariat"
	spawn_sound = 'sound/effects/machine_done.ogg'

/obj/effect/mob_spawn/human/bougie
	name = "embraced birth casket"
	desc = "Reforms Bourgeoise, those without taint of body."
	icon = 'icons/obj/spawners.dmi'
	icon_state = "bougie"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	uses = -1
	mob_species = /datum/species/human
	flavour_text = ""
	assignedrole = "Bourgeoise"
	spawn_sound = 'sound/effects/machine_done2.ogg'

/obj/effect/mob_spawn/human/cleanser
	name = "sterile cleancasket"
	desc = "Regenerates Cleansers, to ensure the health of the masses."
	icon = 'icons/obj/spawners.dmi'
	icon_state = "prole"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	uses = -1
	flavour_text = ""
	assignedrole = "Cleanser"
	outfit = /datum/outfit/city/cleanser

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
	flavour_text = ""
	assignedrole = "Kommandant"
	outfit = /datum/outfit/city/kommandant

// Testing spawners
/obj/effect/mob_spawn/human/vagrant
	name = "scvm birther"
	desc = "Births Vagrants."
	icon = 'icons/obj/spawners.dmi'
	icon_state = "bioslave"
	density = TRUE
	permanent = TRUE
	roundstart = FALSE
	death = FALSE
	uses = -1
	mob_gender = MALE
	mob_species = /datum/species/vagrant
	flavour_text = ""
	assignedrole = "Vagrant"

// latejoins (2
/obj/effect/landmark/latejoin/proletariat
	name = "JoinLateProle"

/obj/effect/landmark/latejoin/bougie
	name = "JoinLateBougie"

/obj/effect/landmark/latejoin/kommandant
	name = "JoinLateKomm"

/obj/effect/landmark/latejoin/cleanser
	name = "JoinLateCleanser"

/obj/effect/landmark/latejoin/vagrant
	name = "JoinLateVagrant"