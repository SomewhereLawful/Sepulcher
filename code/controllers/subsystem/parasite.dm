SUBSYSTEM_DEF(parasite)
	name = "Parasites"
	flags = SS_NO_FIRE

	var/list/active_parasites = list() //List of Active parasite in all mobs; purely for quick referencing.
	var/list/parasite
	var/list/archive_parasites = list()

/datum/controller/subsystem/parasite/PreInit()
	if(!parasite)
		parasite = subtypesof(/datum/parasite)

/datum/controller/subsystem/parasite/stat_entry(msg)
	..("P:[active_parasites.len]")
