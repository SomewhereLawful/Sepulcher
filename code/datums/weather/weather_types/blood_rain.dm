/datum/weather/blood_rain
	name = "blood rain"
	desc = "Some fetid machination beyond the city has performed a ritual sacrifice of a nearby tribe. Blood rains from the sky, everything begins to smell of metal. Outdoor cultivations are boosted, fishing is safer, but the fear that such a fate may befall here reminds everyone that their time is limited and at mercy to forces above them. Exposure without trivial clothings increases chances of contracting parasites."
	probability = 7

	telegraph_duration = 140
	telegraph_overlay = "blood_trickle"
	telegraph_message = "<span class='userdanger'>Some machination beyond the city has sacrificed of a nearby tribe. Bloods begins to trickle from the sky, everything in a metallic stench.</span>"
	telegraph_sound = 'sound/weather/rain/start_windthunder.ogg'

	weather_message = "<span class='userdanger'><i>Sickeningly thick blood falls from the sky.</i></span>"
	weather_overlay = "blood_rain"
	weather_duration_lower = 1200
	weather_duration_upper = 2400
	weather_sound = 'sound/weather/rain/outside/rainthunder.ogg'

	end_duration = 100
	end_message = "<span class='boldannounce'>The red downpour gradually slows to a light, grim shower. The stench remains.</span>"
	end_sound = 'sound/ambience/acidrain_end.ogg'
	end_overlay = "blood_trickle"

	areas_type = list(/area/exterior/city, /area/exterior/wastes)
	protected_areas = list(/area/void, /area/interior)
	target_trait = ZTRAIT_STATION

	immunity_type = "bloodrain"

	barometer_predictable = TRUE

	affects_turfs = TRUE

	carbons_only = TRUE

/datum/weather/blood_rain/weather_act(mob/living/L)
	if(iscarbon(L))
		var/resist = L.getarmor(null, "acid")
		if(prob(max(0, 100 - resist)))
			L.adjustToxicityGain(1)

/datum/weather/blood_rain/weather_act_turf(turf/T)
	for(var/O in T) 
		if(is_acidrain_cleanable(O)) //Clean cleanable decals and ammo casings in affected areas
			qdel(O)
