/datum/weather/samosbor
	name = "SAMOSBOR"
	desc = "His gaze approaches. Rescoring the world. Seek shelter or die."
	probability = 1

	telegraph_duration = 140
	telegraph_overlay = "samosbor_fade"
	telegraph_message = "<span class='userdanger'>SAMOSBOR APPROACHES.\nGET TO SHELTER.</span>"
	telegraph_sound = 'sound/weather/samosbor/samosbor_enters.ogg'

	weather_message = "<span class='userdanger'><i>The world warps, bends. Silver essense begins to bead around you.</i></span>"
	weather_overlay = "samosbor_static"
	weather_duration_lower = 1200
	weather_duration_upper = 2400
	weather_sound = 'sound/weather/samosbor/samosbor_mid.ogg'

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

	daylight_changing = TRUE
	daylight_sunColor = "#3c67ae"
	daylight_sunPower = 1
	daylight_sunRange = 0
