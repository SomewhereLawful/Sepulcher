// Tuberculosis areas //

/area/game
	name = "error"
	icon_state = "error"
	has_gravity = 1
	blob_allowed = 0

// Used on non-accessible
/area/game/void
	name = "void"
	icon_state = "dark128"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/game/city
	name = "City"
	icon_state = "wasteland"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	outdoors = 1 // Hold for room-making removal.
