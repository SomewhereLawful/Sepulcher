/datum/weather/samosbor
	name = "SAMOSBOR"
	desc = "His gaze approaches. Rescoring the world. Seek shelter or die."
	probability = 1

	telegraph_duration = 140
	telegraph_overlay = "blood_trickle"
	telegraph_message = "<span class='userdanger'>SAMOSBOR APPROACHES.\nGET TO SHELTER.</span>"
	telegraph_sound = 'sound/weather/rain/start_windthunder.ogg'

	weather_message = "<span class='userdanger'><i>The world warps, bends. Silver essense begins to bead around you.</i></span>"
	weather_overlay = "samosbor_static"
	weather_duration_lower = 1200
	weather_duration_upper = 2400
	weather_sound = 'sound/weather/rain/outside/rainthunder.ogg'

	end_duration = 100
	end_message = "<span class='boldannounce'>The world has been viewed. SAMOSBOR leaves.</span>"
	end_sound = 'sound/ambience/acidrain_end.ogg'
	end_overlay = "samosbor_fade"

	areas_type = list(/area/exterior/city, /area/exterior/wastes)
	protected_areas = list(/area/void, /area/interior)
	target_trait = ZTRAIT_STATION
	immunity_type = "bloodrain"
	affects_turfs = TRUE
	carbons_only = TRUE

/datum/weather/acid_rain/weather_act(mob/living/L)
	if(iscarbon(L))
		if(is_acidrain_immune(L))
			return
		var/resist = L.getarmor(null, "acid")
		if(prob(max(0, 100 - resist)))
			L.adjustToxicityGain(1)

/datum/weather/acid_rain/weather_act_turf(turf/T)
	for(var/O in T) 
		if(is_acidrain_cleanable(O)) //Clean cleanable decals and ammo casings in affected areas
			qdel(O)
