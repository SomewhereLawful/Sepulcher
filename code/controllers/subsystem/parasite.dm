SUBSYSTEM_DEF(parasite)
	name = "Parasite"
	flags = SS_NO_FIRE

	var/list/active_parasites = list() //List of Active parasites in all mobs; purely for quick referencing.
	var/list/parasites

/datum/controller/subsystem/parasite/PreInit()
	if(!parasites)
		parasites = subtypesof(/datum/parasite)

/datum/controller/subsystem/parasite/stat_entry(msg)
	..("P:[active_parasites.len]")
