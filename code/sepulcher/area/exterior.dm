//			 //
// EXTERIORS //
//			 //
/area/exterior
	name = "EXTERIOR"
	icon_state = "city"
	outdoors = 1
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	flags_1 = CAN_BE_DIRTY_1
	ambient_background = list('sound/ambience/city_wind2.ogg')

/area/exterior/city
	name = "City Streets"
	icon_state = "city"

/area/exterior/city/spillage
	name = "Spillage Zone"
	icon_state = "city"

/area/exterior/city/church_yard
	name = "Church Yard"
	icon_state = "city"

/area/exterior/city/docks
	name = "City Docks"
	icon_state = "city_docks"
	ambient_music = list('sound/ambient_music/hl2_song32.ogg')
	ambient_background_cooldown = 100
	ambient_background = list('sound/ambience/shore/wave1.ogg', 'sound/ambience/shore/wave2.ogg', 'sound/ambience/shore/wave3.ogg', 'sound/ambience/shore/wave4.ogg', 'sound/ambience/shore/wave5.ogg', 'sound/ambience/shore/wave6.ogg')
	narrate = "Red waters lap at the docks. The horizon hazes into the sky, companioned by the stench of salt and ocean air."

/area/exterior/wastes
	name = "The Wastes"
	icon_state = "wastes"
	ambient_music = list('sound/ambient_music/hl2_song27.ogg')
	ambient_background = list('sound/ambience/wasteland/wasteland_wind.ogg')
	narrate = "The wastes expand outward to moaning, fogged edges. There's nothing out here worth dying over."