/datum/weather/fisherman_rain
	name = "fisherman's rain"
	desc = "Dark grey clouds come from the ocean, rain trickles down over the city. The seawater froths with the smell of shellfish and mud. Reminds some of sleepy, happier days that never existed."
	probability = 7

	telegraph_duration = 140
	telegraph_overlay = "blood_trickle"
	telegraph_message = "<span class='userdanger'>Dark grey clouds come from the ocean. Reminds some of sleepy, happier days that never existed...</span>"
	telegraph_sound = 'sound/weather/rain/start_windthunder.ogg'

	weather_message = "<span class='userdanger'><i>Water trickles from the firmament, a somber tune seems to enter your mind.</i></span>"
	weather_overlay = "blood_rain"
	weather_duration_lower = 1200
	weather_duration_upper = 2400
	weather_sound = 'sound/weather/rain/outside/rainthunder.ogg'

	end_duration = 100
	end_message = "<span class='boldannounce'>The rain stops. The grey clouds return to the ocean.</span>"
	end_sound = 'sound/ambience/acidrain_end.ogg'
	end_overlay = "blood_trickle"

	areas_type = list(/area/exterior/city, /area/exterior/wastes)
	protected_areas = list(/area/void, /area/interior)
	target_trait = ZTRAIT_STATION

	immunity_type = "bloodrain"

	barometer_predictable = TRUE

	affects_turfs = TRUE

	carbons_only = TRUE

/*
/datum/weather/fisherman_rain/weather_act(mob/living/L)
	if(iscarbon(L))
		if(is_acidrain_immune(L))
			return
		var/resist = L.getarmor(null, "acid")
		if(prob(max(0, 100 - resist)))
			L.adjustToxicityGain(1)
*/

/datum/weather/fisherman_rain/weather_act_turf(turf/T)
	for(var/O in T) 
		if(is_acidrain_cleanable(O)) //Clean cleanable decals and ammo casings in affected areas
			qdel(O)
