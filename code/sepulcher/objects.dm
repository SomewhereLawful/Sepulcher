// Sepulcher objects //
// This is effectively a dump file until it's safe to sort into specific files //

/obj/structure/closet/crate/dumpster
	name = "dumpster"
	desc = null
	icon_state = "dumpster"

/obj/structure/chair/pew
	name = "pew"
	icon_state = "bleacher"

/obj/structure/chair/pew/left
	icon_state = "bleacher_l"

/obj/structure/chair/pew/right
	icon_state = "bleacher_r"

/obj/structure/table/stalker
	name = "table"
	desc = "A square piece of metal standing on four metal legs. It can not move."
	icon = 'icons/obj/smooth_structures/stol_stalker.dmi'
	icon_state = "stol"

/obj/structure/table/bar
	name = "table"
	desc = "A square piece of metal standing on four metal legs. It can not move."
	icon = 'icons/obj/smooth_structures/stol_stalker_bar.dmi'
	icon_state = "bar"

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
	density = TRUE
	anchored = TRUE
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

/obj/structure/decor/foundry
	name = "steel bucket"
	desc = "Capable of holding liquid steel - withstanding the foundry maw heat. Yet, this is broken and incapable of moving."
	icon_state = "steel_bucket"

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

/obj/structure/decor/grave
	name = "grave"
	desc = "Inscribed with unreadable text. The home of those who escaped this torment."
	icon_state = "grave1"
	density = FALSE

/obj/structure/decor/grave/New()
	if(icon_state == "grave1")
		icon_state = "grave[rand(1,3)]"
	..()

/obj/structure/decor/saint_icon
	name = "icon"
	icon_state = "saint_icon"

/obj/structure/decor/iconostasis
	name = "iconostasis"
	icon_state = "deacon_door"
	density = FALSE

/obj/structure/decor/iconostasis/left
	icon_state = "iconostasis_l"
	density = TRUE

/obj/structure/decor/iconostasis/right
	icon_state = "iconostasis_r"
	density = TRUE

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
	icon_state = "candle1"
	density = 0
	light_color = LIGHT_COLOR_TUNGSTEN
	light_power = 1
	light_range = 2

/obj/structure/decor/candle/New()
	if(icon_state == "candle1")
		icon_state = "candle[rand(1,3)]"
	..()

/obj/structure/decor/waste
	name = "waste"
	icon_state = "trash1"

/obj/structure/decor/waste/New()
	pixel_x = rand(-5,5)
	pixel_y = rand(-5,5)
	if(icon_state == "trash1")
		icon_state = "trash[rand(1,4)]"
	..()

/obj/structure/decor/cig_trash
	name = "debris"
	icon_state = "cig_trash1"

/obj/structure/decor/cig_trash/New()
	pixel_x = rand(-5,5)
	pixel_y = rand(-5,5)
	if(icon_state == "cig_trash1")
		icon_state = "cig_trash[rand(1,5)]"
	..()

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