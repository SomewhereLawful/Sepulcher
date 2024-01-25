//			 //
// INTERIORS //
//			 //
/area/interior
	name = "INTERIOR"
	icon_state = "interior"
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
	narrate = "Rancid smell of shit and blood. There is nothing soft, nothing elegant of this pit."

/area/interior/spawning/prole
	name = "prole spawn"
	icon_state = "prole"
	narrate = "The first breaths of a proletariat's life are of black grease and offal."

/area/interior/spawning/bougie
	name = "bourgeoisie spawn"
	icon_state = "bougie"
	narrate = "A subtle hint of flowers and leather dances in this air. Unheard opulence in this city."

/area/interior/spawning/kommandant
	name = "kommandant"
	icon_state = "kommandant"
	narrate = "The air is electric, scents of rubber and shoe polish come from the kasket. Here saints are remade -- and recycled."

/area/interior/city
	name = "City Interiors"
	icon_state = "interior"

/area/interior/parlor
	name = "Parlor"
	icon_state = "interior"

/area/interior/apartments
	name = "Apartments"
	icon_state = "interior"
	narrate = "Someone cooks nearby. Packed like canfish, here the safest solitude."

/area/interior/clinic
	name = "Clinic"
	icon_state = "interior"
	ambient_background_cooldown = 26
	ambient_background = list('sound/ambience/interiors/hospital.ogg')
	narrate = "Acrid spirits billow through the thick air. A bite of gangrene hides within, here no respite from this world's decay."

/area/interior/foundry
	name = "foundry"
	icon_state = "foundry"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	ambient_background_cooldown = 26
	ambient_background = list('sound/ambience/interiors/foundry.ogg')
	narrate = "Opressively hot."

/area/interior/train_yard
	name = "train yard"
	icon_state = "trainyard"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	narrate = "Dust and gravel inhabit the air. Corpse-cold engines live here, bringing and taking."

/area/interior/sewer
	name = "sewer"
	icon_state = "sewer"
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	ambient_environment = list('sound/ambience/sewer/moan1.ogg','sound/ambience/sewer/muffled_cry1.ogg','sound/ambience/sewer/scared_breathing1.ogg','sound/ambience/sewer/scared_breathing2.ogg')
	ambient_background_cooldown = 120
	ambient_background = list('sound/ambience/sewer/sewer_air.ogg')
	narrate = "Air thick with effluvium and stagnant sewage. Here one collects fertilizer, and parasites."