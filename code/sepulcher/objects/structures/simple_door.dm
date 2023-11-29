// Fine, I'll do it myself
// /obj/structure/simple_door redo
/obj/structure/door
	name = "door"
	icon = 'icons/obj/doors/wastelanddoors.dmi'
	icon_state = "house"
	opacity = TRUE
	density = TRUE
	anchored = TRUE
	layer = CLOSED_DOOR_LAYER

	var/open_sound = 'sound/machines/door_open.ogg'
	var/close_sound = 'sound/machines/door_close.ogg'
	var/opening_time = 2
	var/closing_time = 4

	var/lockable = FALSE
	var/locked = FALSE

	var/outside_lock_dir = NORTH
	var/inside_lock_dir = SOUTH

	var/door_type = "house"
	var/open = 1
	var/moving = 0