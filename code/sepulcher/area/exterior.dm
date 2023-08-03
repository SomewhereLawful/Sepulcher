//			 //
// EXTERIORS //
//			 //
/area/exterior
	name = "EXTERIOR"
	icon_state = "city"
	outdoors = 1
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	flags_1 = CAN_BE_DIRTY_1
	ambient_background = list('sound/ambience/city_wind2.ogg' = 100)

/area/exterior/city
	name = "City Streets"
	icon_state = "city"

/area/exterior/city/docks
	name = "City Docks"
	icon_state = "city"
	ambient_music = list('sound/ambient_music/hl2_song32.ogg')
	ambient_background = list('sound/ambience/shore/wave1.ogg' = 100, 'sound/ambience/shore/wave2.ogg' = 100, 'sound/ambience/shore/wave3.ogg' = 100, 'sound/ambience/shore/wave4.ogg' = 100, 'sound/ambience/shore/wave5.ogg' = 100, 'sound/ambience/shore/wave6.ogg' = 100)

/area/exterior/wastes
	name = "The Wastes"
	icon_state = "wastes"
	ambient_music = list('sound/ambient_music/hl2_song27.ogg')
	ambient_background = list('sound/ambience/wasteland/wasteland_wind.ogg' = 100)
	narrate = "Red, damp sand and burnt wooden spires stretch to the horizon. Birds glide amoungst the trees looking for a meal."
