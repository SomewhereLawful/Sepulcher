#define NO_MAXVOTES_CAP -1

SUBSYSTEM_DEF(autotransfer)
	name = "Autotransfer Vote"
	flags = SS_KEEP_TIMING | SS_BACKGROUND
	wait = 1 MINUTES

	var/starttime
	var/targettime
	var/voteinterval
	var/maxvotes
	var/curvotes = 0

/datum/controller/subsystem/autotransfer/Initialize(timeofday)
	var/init_vote = 72000 // 2 hours in deciseconds
	if(!init_vote) //Autotransfer voting disabled.
		can_fire = FALSE
		return ..()
	starttime = world.time
	targettime = starttime + init_vote
	voteinterval = 18000 // 30 minutes in deciseconds
	maxvotes = 4 // Max extensions before true autoend
	return ..()

/datum/controller/subsystem/autotransfer/Recover()
	starttime = SSautotransfer.starttime
	voteinterval = SSautotransfer.voteinterval
	curvotes = SSautotransfer.curvotes

/datum/controller/subsystem/autotransfer/fire()
	if(world.time < targettime)
		return
	else
		SSshuttle.autoEnd()

#undef NO_MAXVOTES_CAP
