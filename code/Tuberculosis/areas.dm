// Tuberculosis areas //

/area/game
	name = "error"
	icon_state = "error"
	blob_allowed = 0
	requires_power = 0
	has_gravity = STANDARD_GRAVITY
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED

// Used on non-accessible
/area/game/void
	name = "void"
	icon_state = "dark128"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/game/city
	name = "city"
	icon_state = "city"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	outdoors = 1 // Hold for room-making removal.

// Spawn areas for City
/area/game/spawning // Parented for shared ambientsounds
	name = "spawning area"
	icon_state = "unknown"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')

/area/game/spawning/bioslave
	name = "bioslave prison"
	icon_state = "bioslave"

/area/game/spawning/prole
	name = "prole spawn"
	icon_state = "prole"

/area/game/spawning/bougie
	name = "bourgeoisie spawn"
	icon_state = "bougie"

/area/game/spawning/kommandant
	name = "kommandant"
	icon_state = "kommandant"


/area/game/foundry
	name = "foundry"
	icon_state = "foundry"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')

/area/game/train_yard
	name = "train yard"
	icon_state = "trainyard"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')

/area/game/sewer
	name = "sewer"
	icon_state = "trainyard"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
