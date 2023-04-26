// Sepulcher areas //

// Used on non-accessible
/area/void
	name = "void"
	icon_state = "dark128"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/exterior
	name = "EXTERIOR"
	icon_state = "city"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	outdoors = 1
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	flags_1 = CAN_BE_DIRTY_1
	ambient_background = list('sound/ambience/city_wind2.ogg' = 10)

/area/exterior/city
	name = "City Streets"
	icon_state = "city"

/area/exterior/city/docks
	name = "City Docks"
	icon_state = "city"
	ambient_music = list('sound/ambient_music/hl2_song32.ogg')
	ambient_environment = list('sound/ambience/docks_tone.ogg')

/area/exterior/wastes
	name = "The Wastes"
	icon_state = "city"

//			 //
// INTERIORS //
//			 //
/area/interior
	name = "INTERIOR"
	icon_state = "interior"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	outdoors = 0
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	flags_1 = CAN_BE_DIRTY_1

// Spawn areas for City
/area/interior/spawning // Parented for shared ambientsounds
	name = "spawning area"
	icon_state = "unknown"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')

/area/interior/spawning/bioslave
	name = "bioslave prison"
	icon_state = "bioslave"

/area/interior/spawning/prole
	name = "prole spawn"
	icon_state = "prole"

/area/interior/spawning/bougie
	name = "bourgeoisie spawn"
	icon_state = "bougie"

/area/interior/spawning/kommandant
	name = "kommandant"
	icon_state = "kommandant"

/area/interior/city
	name = "City Interiors"
	icon_state = "interior"

/area/interior/parlor
	name = "Parlor"
	icon_state = "interior"

/area/interior/apartments
	name = "Apartments"
	icon_state = "interior"

/area/interior/clinic
	name = "Clinic"
	icon_state = "interior"

/area/interior/foundry
	name = "foundry"
	icon_state = "foundry"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')

/area/interior/train_yard
	name = "train yard"
	icon_state = "trainyard"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')

/area/interior/sewer
	name = "sewer"
	icon_state = "sewer"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	ambient_environment = list('sound/ambience/sewer/moan1.ogg','sound/ambience/sewer/muffled_cry1.ogg','sound/ambience/sewer/scared_breathing1.ogg','sound/ambience/sewer/scared_breathing2.ogg')
	ambient_background = list('sound/ambience/sewer/sewer_loop.ogg' = 100)
