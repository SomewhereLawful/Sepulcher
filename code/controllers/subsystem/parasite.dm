SUBSYSTEM_DEF(parasite)
	name = "Parasite"
	flags = SS_NO_FIRE

	var/list/active_parasites = list() //List of Active disease in all mobs; purely for quick referencing.
	var/list/parasites
	var/list/archive_parasites = list()

	var/static/list/list_symptoms = subtypesof(/datum/symptom)

/datum/controller/subsystem/disease/PreInit()
	if(!parasites)
		parasites = subtypesof(/datum/disease)

/datum/controller/subsystem/disease/Initialize(timeofday)
	var/list/all_common_diseases = parasites - typesof(/datum/disease/advance)
	for(var/common_disease_type in all_common_diseases)
		var/datum/disease/prototype = new common_disease_type()
		archive_parasites[prototype.GetDiseaseID()] = prototype
	..()

/datum/controller/subsystem/disease/stat_entry(msg)
	..("P:[active_parasites.len]")

/datum/controller/subsystem/disease/proc/get_disease_name(id)
	var/datum/disease/advance/A = archive_parasites[id]
	if(A.name)
		return A.name
	else
		return "Unknown"
