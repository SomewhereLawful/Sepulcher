// Sepulcher objects //
// This is effectively a dump file until it's safe to sort into specific files //

/obj/structure/closet/crate/dumpster
	name = "dumpster"
	desc = null
	icon_state = "dumpster"

/obj/structure/table/stalker
	name = "table"
	desc = null
	icon = 'icons/obj/smooth_structures/stol_stalker.dmi'
	icon_state = "stol"

/obj/structure/table/bar
	name = "table"
	desc = null
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

/obj/structure/decor/mirror/north
	name = "mirror"
	icon_state = "junk_mirror"
	pixel_y = 28

/obj/structure/decor/mirror/east
	name = "mirror"
	icon_state = "junk_mirror"
	pixel_x = 26

/obj/structure/decor/mirror/south
	name = "mirror"
	icon_state = "junk_mirror"
	pixel_y = -28

/obj/structure/decor/mirror/west
	name = "mirror"
	icon_state = "junk_mirror"
	pixel_x = -26

/obj/structure/decor/washer
	name = "clothes washer"
	desc = "In disrepair. Smells of nightsoil."
	icon_state = "washer"

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
	desc = "A vessel yet unable to function."
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
	layer = TURF_DECAL_LAYER

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
	layer = TURF_DECAL_LAYER

/obj/structure/decor/grave/New()
	if(icon_state == "grave1")
		icon_state = "grave[rand(1,3)]"
	..()

/obj/structure/decor/saint_icon
	name = "icon"
	desc = "The spiritual look to him. Whoever he was."
	icon_state = "saint_icon"
	density = FALSE

/obj/structure/decor/iconostasis
	name = "iconostasis"
	icon_state = "deacon_door"
	density = FALSE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/decor/iconostasis/left
	icon_state = "iconostasis_l"
	density = TRUE
	layer = 3

/obj/structure/decor/iconostasis/right
	icon_state = "iconostasis_r"
	density = TRUE
	layer = 3

// decor objects with their own icon files
/obj/structure/decor/carpet
	name = "carpet"
	icon = 'icons/sepulcher/carpet.dmi'
	icon_state = "cover"
	bound_width = 64
	density = 0
	layer = TURF_DECAL_LAYER

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
	layer = TURF_DECAL_LAYER

/obj/structure/decor/candle/New()
	if(icon_state == "candle1")
		icon_state = "candle[rand(1,3)]"
	..()

/obj/structure/decor/waste
	name = "waste"
	desc = "Worthless and useless."
	gender = PLURAL
	icon_state = "trash1"
	density = FALSE
	layer = TURF_DECAL_LAYER

/obj/structure/decor/waste/New()
	pixel_x = rand(-5,5)
	pixel_y = rand(-5,5)
	if(icon_state == "trash1")
		icon_state = "trash[rand(1,4)]"
	..()

/obj/structure/decor/cig_trash
	name = "debris"
	desc = "Nails long since immolated and picked over."
	gender = PLURAL
	icon_state = "cig_trash1"
	density = FALSE
	layer = TURF_DECAL_LAYER

/obj/structure/decor/cig_trash/New()
	pixel_x = rand(-5,5)
	pixel_y = rand(-5,5)
	if(icon_state == "cig_trash1")
		icon_state = "cig_trash[rand(1,5)]"
	..()

/obj/structure/decor/jangseung
	name = "boundry marker"
	desc = "Here ends the protection of the city. There is much worse beyond."
	gender = PLURAL
	icon_state = "cig_trash1"

/obj/structure/fence/church
	name = "wrought iron fence"
	desc = null
	icon_state = "churchfence"
	cuttable= FALSE

/obj/structure/fence/church/post
	icon_state = "churchfencepost"

/obj/structure/fence/church/end
	icon_state = "churchfenceend"

/obj/structure/fence/church/corner
	icon_state = "churchfencecorner"

// wooden fence
/obj/structure/fence/wooden
	name = "wrought iron fence"
	desc = null
	icon_state = "wood_fence"
	cuttable= FALSE

/obj/structure/fence/wooden/post
	icon_state = "wood_fence_post"

/obj/structure/fence/wooden/end
	icon_state = "wood_fence_end"

/obj/structure/fence/wooden/corner
	icon_state = "wood_fence_corner"

/obj/structure/fence/sewer_grate
	name = "sewer grate"
	desc = null
	icon_state = "sewer_grate"
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
