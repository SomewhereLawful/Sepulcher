/datum/weather/blood_rain
	name = "blood rain"
	desc = "Some fetid machination beyond the city has performed a ritual sacrifice of a nearby tribe. Blood rains from the sky, everything begins to smell of metal. Outdoor cultivations are boosted, fishing is safer, but the fear that such a fate may befall here reminds everyone that their time is limited and at mercy to forces above them. Exposure without trivial clothings increases chances of contracting parasites."
	probability = 7

	telegraph_duration = 400
	telegraph_overlay = "snow_storm"
	telegraph_message = "<span class='userdanger'>Some machination beyond the city has sacrificed of a nearby tribe. Blood begins to fall from the sky, everything in a metallic stench.</span>"
	telegraph_sound = 'sound/ambience/acidrain_start.ogg'

	weather_message = "<span class='userdanger'><i>Sickeningly thick blood falls from the sky. </i></span>"
	weather_overlay = "acid_rain"
	weather_duration_lower = 1200
	weather_duration_upper = 2400
	weather_sound = 'sound/ambience/acidrain_mid.ogg'

	end_duration = 100
	end_message = "<span class='boldannounce'>The red downpour gradually slows to a light, grim shower. The stench remains.</span>"
	end_sound = 'sound/ambience/acidrain_end.ogg'

	areas_type = list(/area/game/city)
	protected_areas = list(/area/game/city/interior, /area/game/void, /area/game/spawning, /area/game/spawning/bioslave, /area/game/spawning/bougie, /area/game/spawning/kommandant, /area/game/spawning/prole, /area/game/foundry, /area/game/train_yard, /area/game/sewer)
	target_trait = ZTRAIT_STATION

	immunity_type = "acid" // temp

	barometer_predictable = TRUE

	affects_turfs = TRUE

	carbons_only = TRUE

/* Commented until toxadjust is done - dumbass
/datum/weather/acid_rain/weather_act(mob/living/L)
	if(iscarbon(L))
		if(is_acidrain_immune(L))
			return
		var/resist = L.getarmor(null, "acid")
		if(prob(max(0, 100 - resist)))
			L.acid_act(15, 10)
*/

/datum/weather/acid_rain/weather_act_turf(turf/T)
	for(var/O in T) 
		if(is_acidrain_cleanable(O)) //Clean cleanable decals and ammo casings in affected areas
			qdel(O)
