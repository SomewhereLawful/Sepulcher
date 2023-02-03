// ALL standard walls in Tuberculosis are Indestrucible.
// Some destructible walls may be present in special locations.
/turf/closed/indestructible/nothing
	name = "nothing"
	desc = "The nothingness of the world, unseen as it should. If found, dark omens are afoot."
	icon_state = "black"

// Stalker walls
/turf/closed/wall/beton
	name = "wall"
	icon = 'icons/tuberculosis/walls/beton_tg.dmi'
	icon_state = "beton"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
	/turf/closed/wall/beton,
	/turf/closed/wall/beton_agro)

/turf/closed/wall/bricks
	name = "wall"
	icon = 'icons/tuberculosis/walls/bricks_tg.dmi'
	icon_state = "bricks"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
	/turf/closed/wall/bricks)

/turf/closed/wall/bricks_yellow
	name = "wall"
	icon = 'icons/tuberculosis/walls/bricks_tg_yellow.dmi'
	icon_state = "bricks"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
	/turf/closed/wall/bricks_yellow)

/turf/closed/wall/bricks_white
	name = "wall"
	icon = 'icons/tuberculosis/walls/bricks_tg_white.dmi'
	icon_state = "bricks"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
	/turf/closed/wall/bricks_white)

/turf/closed/wall/beton_agro
	name = "wall"
	icon = 'icons/tuberculosis/walls/beton_w_tg.dmi'
	icon_state = "beton"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
	/turf/closed/wall/beton_agro)

/turf/closed/wall/ship
	name = "hull"
	icon = 'icons/tuberculosis/walls/barzha.dmi'
	icon_state = "hull"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/closed/wall/ship)

/turf/closed/wall/log
	name = "log wall"
	icon = 'icons/tuberculosis/walls/log.dmi'
	icon_state = "log"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/closed/wall/log)

/turf/closed/wall/brickdark
	name = "brick wall"
	icon = 'icons/tuberculosis/walls/brick_walldark.dmi'
	icon_state = "brickwall"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/closed/wall/brickdark)

/turf/closed/wall/ship_hull
	name = "hull"
	icon = 'icons/tuberculosis/walls/ship_hull.dmi'
	icon_state = "hull1"
	smooth = SMOOTH_FALSE
