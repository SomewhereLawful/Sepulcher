// Differs from fences currently, using adapted direction window canpass()
// Meant to allow directional density while still being separate structures.

/obj/structure/railing
	name = "railing"
	icon = 'icons/obj/fence.dmi'
	icon_state = "railing"
	layer = ABOVE_MOB_LAYER
	density = TRUE
	anchored = TRUE

/obj/structure/railing_end
	name = "railing"
	icon = 'icons/obj/fence.dmi'
	icon_state = "railing_end"
	layer = ABOVE_MOB_LAYER
	density = FALSE
	anchored = TRUE

/obj/structure/railing/Initialize()
	. = ..()
	if(dir == NORTH) // Keeps north directional railings on the same tile but appearing almost one tile above
		pixel_y = 12
	if(dir == 4 || dir == 8)
		pixel_y = 14

/obj/structure/railing/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && (mover.pass_flags & PASSGLASS))
		return 1
	if(get_dir(loc, target) == dir)
		return !density
	return 1

/obj/structure/railing/CheckExit(atom/movable/O, turf/target)
	if(istype(O) && (O.pass_flags & PASSGLASS))
		return 1
	if(get_dir(O.loc, target) == dir)
		return 0
	return 1
