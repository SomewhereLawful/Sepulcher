// Tuberculosis objects //
// This is effectively a dump file until it's safe to sort into specific files //

/obj/structure/campfire/drum
	name = "firepit"
	desc = "A beacon of warmth. Huddle around when the air goes frigid."
	icon_state = "drumfire"
	density = 1

/obj/structure/bed/mattress
	name = "mattress"
	desc = "Cushion for the body. Has seen much more horror than you."
	icon_state = "mattress1"

/obj/structure/bed/mattress/New()
	..()
	icon_state = "mattress[rand(1,6)]"

// Decorative objects
/obj/structure/decor
	icon = 'icons/tuberculosis/decor.dmi'
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
	icon = 'icons/tuberculosis/carpet.dmi'
	icon_state = "cover"
	bound_width = 64
	density = 0

/obj/structure/decor/water_tank
	name = "fluid tank"
	icon = 'icons/tuberculosis/farm.dmi'
	icon_state = "watertank1"
	bound_width = 64
