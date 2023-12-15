#define DAYLIGHT_NEUTRAL "neutral"
#define DAYLIGHT_SAMOSBOR "samosbor"
#define DAYLIGHT_BLOOD_RAIN "blood rain"
#define DAYLIGHT_ASH_BILLOW "ash billow"
#define DAYLIGHT_FISHERMAN_RAIN "fisherman's rain"
#define DAYLIGHT_MIASMA "miasma haze"

GLOBAL_LIST_INIT(daylight_turfs, typecacheof(list(
	/turf/open/indestructible/ground/outside,
	/turf/open/floor/plating/f13/outside)))

SUBSYSTEM_DEF(daylight)
	name = "Daylight"
	wait = 1 //was 4
	//var/flags = 0	//see MC.dm in __DEFINES Most flags must be set on world start to take full effect. (You can also restart the mc to force them to process again
	can_fire = TRUE

	var/sunColour = "#e26060"
	var/sunPower = 0.3
	var/sunRange = 0

	var/init_sunColour = "#e26060"
	var/init_sunPower = 0.3
	var/init_sunRange = 0

	var/currentColumn
	var/working = 3
	var/doColumns //number of columns to do at a time

/datum/controller/subsystem/daylight/fire(resumed = FALSE)
	if(working)
		doWork()
		return
	if(nextBracket())
		working = 1
		currentColumn = 1

/datum/controller/subsystem/daylight/proc/nextBracket()
	var/Time = station_time()
	var/currentTime
	if(Time != currentTime)
		currentTime = Time
		. = TRUE

/datum/controller/subsystem/daylight/proc/doWork()
	doInitialDaylightSetup()

/datum/controller/subsystem/daylight/proc/updateDaylight(updating, new_range, new_color, new_power)
	if(updating)
		if(new_range)
			sunPower = new_range
		if(new_color)
			sunColour = new_color
		if(new_power)
			sunPower = new_power
	else
		sunPower = init_sunPower
		sunColour = init_sunColour
		sunPower = init_sunPower
	doInitialDaylightSetup()

/datum/controller/subsystem/daylight/proc/doInitialDaylightSetup()
	var/list/currentTurfs = list()
	var/x = min(currentColumn + doColumns, world.maxx)
	for (var/z in SSmapping.levels_by_trait(ZTRAIT_STATION))
		currentTurfs += block(locate(currentColumn,1,z), locate(x,world.maxy,z))
	for (var/t in currentTurfs)
		var/turf/T = t
		if(T.type in GLOB.daylight_turfs)
			T.set_light(T.turf_light_range, sunPower, sunColour)

	currentColumn = x + 1
	if (currentColumn > world.maxx)
		currentColumn = 1
		working = 0
		return

/*
	switch(weather)
		if(DAYLIGHT_SAMOSBOR)
			newColor = "#3c67ae"
			newPower = 1
		if(DAYLIGHT_BLOOD_RAIN)
			newColor = "#3c67ae"
			newPower = 1
		if(DAYLIGHT_ASH_BILLOW)
			newColor = "#3c67ae"
			newPower = 1
		if(DAYLIGHT_FISHERMAN_RAIN)
			newColor = "#3c67ae"
			newPower = 1
		if(DAYLIGHT_MIASMA)
			newColor = "#3c67ae"
			newPower = 1
		else
			newColor = "#e26060"
			newPower = 0.75
*/