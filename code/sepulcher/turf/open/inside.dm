/turf/open/indestructible/ground/floor
	name = "floor"
	icon = 'icons/sepulcher/floor.dmi'

/turf/open/indestructible/ground/floor/lattice
	name = "floor"
	icon_state = "lattice_new1"

/turf/open/indestructible/ground/floor/lattice/New()
	if(icon_state == "lattice_new1")
		icon_state = "lattice_new[rand(1,21)]"
	..()

/turf/open/indestructible/ground/floor/wood_floor
	name = "floor"
	icon_state = "wood1"

	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/floor/wood_floor/New()
	if(icon_state == "wood1")
		icon_state = "wood[rand(1,25)]"
	..()

/turf/open/indestructible/ground/floor/wood_floor/horizontal
	name = "floor"
	icon_state = "woodd1"

/turf/open/indestructible/ground/floor/wood_floor/horizontal/New()
	if(icon_state == "woodd1")
		icon_state = "woodd[rand(1,25)]"
	..()

/turf/open/indestructible/ground/floor/stairs
	name = "stairs"
	icon_state = "stairsup"
	gender = PLURAL

/turf/open/indestructible/ground/floor/stairs/down
	icon_state = "stairsdown"

/turf/open/indestructible/ground/floor/bath_tile
	name = "floor"
	icon_state = "plitka1"

/turf/open/indestructible/ground/floor/bath_tile/New()
	if(icon_state == "plitka1")
		icon_state = "plitka[rand(1,7)]"
	..()