// Sepulcher objects //
// This is effectively a dump file until it's safe to sort into specific files //

/obj/structure/campfire/drum
	name = "firepit"
	desc = "A beacon of warmth. Huddle around when the air goes frigid."
	icon_state = "drumfire"
	density = 1
	fuel = 999999999 // Basically infinite

/obj/structure/bed/mattress
	name = "mattress"
	desc = "Cushion for the body. Has seen much more horror than you."
	icon_state = "mattress1"

/obj/structure/bed/mattress/New()
	..()
	icon_state = "mattress[rand(1,6)]"

// Decorative objects
/obj/structure/decor
	icon = 'icons/sepulcher/decor.dmi'
	density = 1
	anchored = 1
	layer = OBJ_LAYER

/obj/structure/decor/spool
	name = "spool"
	icon_state = "katushka"

/obj/structure/decor/dump_bin
	name = "dump bin"
	icon_state = "yashik_musor"

/obj/structure/decor/dump_bin/full
	icon_state = "yashik_musor_full"

/obj/structure/decor/dump_bin/red
	icon_state = "yashik_musor_red"

/obj/structure/decor/dump_bin/red/full
	icon_state = "yashik_musor_red_full"

/obj/structure/decor/apc
	name = "broken panel"
	icon_state = "apc1"
	density = 0

/obj/structure/decor/apc/New()
	if(icon_state == "apc1")
		icon_state = "apc[rand(1,3)]"
	..()

/obj/structure/decor/wood_scrap
	name = "wood scrap"
	icon_state = "doski_oblomki_alt1"
	density = 0

/obj/structure/decor/wood_scrap/New()
	if(icon_state == "doski_oblomki_alt1")
		icon_state = "doski_oblomki_alt[rand(1,4)]"
	..()

/obj/structure/decor/tire
	name = "tiring"
	icon_state = "shina1"

/obj/structure/decor/apc/New()
	if(icon_state == "shina1")
		icon_state = "shina[rand(1,5)]"
	..()

// decor objects with their own icon files
/obj/structure/decor/carpet
	name = "carpet"
	icon = 'icons/sepulcher/carpet.dmi'
	icon_state = "cover"
	bound_width = 64
	density = 0

/obj/structure/decor/water_tank
	name = "fluid tank"
	icon = 'icons/sepulcher/farm.dmi'
	icon_state = "watertank1"
	bound_width = 64

/obj/structure/decor/candle
	name = "candles"
	icon_state = "cover"
	density = 0

/obj/structure/fence/church
	name = "wrought iron fence"
	desc = null
	icon_state = "churchfence"
	cuttable= FALSE

// Used in Spawners, to ellicit the larger than 1x1 look
/obj/structure/decor/spawner_part
	icon = 'icons/obj/spawners.dmi'

/obj/structure/decor/spawner_part/prole/left
	name = "Birth-Blood Reservoir"
	icon_state = "prole_left"

/obj/structure/decor/spawner_part/prole/right
	name = "Control Panel"
	icon_state = "prole_right"

/obj/structure/decor/spawner_part/bougie/left
	name = "Enlightenment Machine"
	icon_state = "bougie_left"

/obj/structure/decor/spawner_part/bougie/right
	name = "Vitalizing Percolator"
	icon_state = "bougie_right"

// statues
/obj/structure/fluff/plaza_statue
	name = "Statue of the Warder"
	desc = "He stands a vigil over this accursed city\nHe waits for us, our mission to persist\nMay he come bearing panacea to our sins"
	icon = 'icons/obj/plaza_statue.dmi'
	icon_state = "francis"
	density = TRUE
	anchored = TRUE
	deconstructible = FALSE
	layer = FLY_LAYER