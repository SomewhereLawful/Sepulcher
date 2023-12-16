
// Click to open/close
// Alt-click to knock
// Use keys to unlock/lock

// Resolve - do we want an open locked door to close, remaining locked?
// Some players would prefer to have a door locked open, though security is an issue for restricted areas

/obj/structure/door
	name = "door"
	icon = 'icons/obj/doors/simple_doors.dmi'
	icon_state = "house"
	var/door_icon = "house"
	opacity = TRUE
	density = TRUE
	anchored = TRUE
	layer = CLOSED_DOOR_LAYER

	var/opaque
	var/open_sound = 'sound/machines/door_open.ogg'
	var/close_sound = 'sound/machines/door_close.ogg'
	var/opening_time = 2
	var/closing_time = 4

	var/knocking_sounds = list('sound/f13items/door_knock1.wav', 'sound/f13items/door_knock2.wav', 'sound/f13items/door_knock3.wav', 'sound/f13items/door_knock4.wav')

	var/lock_sound = 'sound/machines/door_open.ogg'
	var/lock_attempt_sound = 'sound/machines/door_open.ogg'
	var/lockable = FALSE
	var/locked = FALSE
	var/visible_lock = FALSE
	var/outside_lock_dir = NORTH
	var/inside_lock_dir = SOUTH
	/// unless null, is tied via ID to toggle locking with keypads/buttons
	var/remote_lock_id

	var/open = FALSE
	var/moving = FALSE

/obj/structure/door/New(location)
	..()
	icon_state = door_icon
	set_opacity(opaque)
	return

/obj/structure/door/examine(mob/user)
	..()
	if(visible_lock)
		to_chat(user, "The door appears to be locked.")

/obj/structure/door/proc/Open(animate)
	playsound(src.loc, open_sound, 30, 0, 0)
	if(animate)
		moving = TRUE
		flick("[door_icon]_opening", src)
		sleep(opening_time)
		moving = FALSE
	set_opacity(0)
	density = FALSE
	icon_state = "[door_icon]_open"
	layer = OPEN_DOOR_LAYER

/obj/structure/simple_door/proc/Close(animate)
	playsound(src.loc, close_sound, 30, 0, 0)
	manual_opened = 0
	if(animate)
		moving = TRUE
		flick("[door_icon]_closing", src)
		sleep(closing_time)
	icon_state = door_icon
	set_opacity(opaque)
	density = 1
	moving = FALSE
	layer = CLOSED_DOOR_LAYER

/obj/structure/door/attack_hand(mob/user)
	if(isliving(user)) //no spooky nonsense
		var/mob/living/M = user
		if(/obj/structure/barricade in src.loc)
			to_chat(user, "The door is barricaded.")
			return
		if(locked)
			playsound(src.loc, lock_attempt_sound, 80, 0, 0)
			to_chat(user, "You try the door, but it is locked.")
			return
		else
			if(open)
				Close(animate)
			else
				Open(animate)
	else
		return

/obj/structure/door/AltClick(mob/user)
	playsound(src.loc, pick(knocking_sounds), 80, 0, 0)
	to_chat(user, "You knock upon the door.")

/obj/structure/door/attackby(obj/item/weapon/I, mob/living/user, params)
	if(istype(I, /obj/item/key))
