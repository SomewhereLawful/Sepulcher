
// Click to open/close
// Alt-click to knock
// Use keys to unlock/lock

/obj/structure/door
	name = "door"
	icon = 'icons/obj/doors/doors.dmi'
	icon_state = "room"
	var/door_icon = "room"
	opacity = TRUE
	density = TRUE
	anchored = TRUE
	layer = CLOSED_DOOR_LAYER

	var/opaque = TRUE
	var/open_sound = 'sound/door/open.ogg'
	var/close_sound = 'sound/door/close.ogg'
	var/opening_time = 2
	var/closing_time = 4

	var/knocking_sounds = list('sound/door/knocking/knock1.ogg', 'sound/door/knocking/knock2.ogg', 'sound/door/knocking/knock3.ogg', 'sound/door/knocking/knock4.ogg')

	var/lock_sound = 'sound/door/lock.ogg'
	var/unlock_sound = 'sound/door/unlock.ogg'
	var/lock_attempt_sound = 'sound/door/locked_attempt.ogg'
	var/lockable = FALSE
	var/locked = FALSE
	var/visible_lock = FALSE
	var/lock_id
	/// unless null, is tied via ID to toggle locking with keypads/buttons
	var/remote_lock_id

	var/open = FALSE

/obj/structure/door/New(location)
	..()
	icon_state = door_icon
	set_opacity(opaque)
	return

/obj/structure/door/examine(mob/user)
	..()
	to_chat(user, "Alt-click to knock.")
	if(visible_lock && locked)
		to_chat(user, "The door appears to be locked.")

/obj/structure/door/proc/doorOpen()
	playsound(src.loc, open_sound, 30, 0, 0)
	flick("[door_icon]_opening", src)
	sleep(opening_time)
	set_opacity(0)
	density = FALSE
	icon_state = "[door_icon]_open"
	layer = OPEN_DOOR_LAYER
	open = TRUE

/obj/structure/door/proc/doorClose()
	playsound(src.loc, close_sound, 30, 0, 0)
	flick("[door_icon]_closing", src)
	sleep(closing_time)
	icon_state = door_icon
	set_opacity(opaque)
	density = TRUE
	layer = CLOSED_DOOR_LAYER
	open = FALSE

/obj/structure/door/attack_hand(mob/user)
	if(isliving(user)) //no spooky nonsense
		if(/obj/structure/barricade in src.loc)
			to_chat(user, "The door is barricaded.")
			return
		if(locked && !open)
			playsound(src.loc, lock_attempt_sound, 80, 0, 0)
			to_chat(user, "You try the door, but it is locked.")
			return
		else
			for(var/atom/movable/M in get_turf(src))
				if(M.density && M != src && open)
					to_chat(user, "Something blocks the door from closing.")
					return
			if(!open)
				doorOpen()
			else
				doorClose()
	else
		return

/obj/structure/door/AltClick(mob/user)
	playsound(src.loc, pick(knocking_sounds), 80, 0, 0)
	to_chat(user, "You knock upon the door.")

/obj/structure/door/attackby(obj/item/key/I, mob/living/user, params)
	if(istype(I, /obj/item/key))
		if(!lockable)
			to_chat(user, "This door lacks the capability to be locked.")
			return
		if(I.lock_id == src.lock_id) //if the key matches our id
			if(locked)
				to_chat(user,"You unlock the door.")
				playsound(src.loc, unlock_sound, 30, 0, 0)
				locked = FALSE
			else
				to_chat(user,"You lock the door.")
				playsound(src.loc, lock_sound, 30, 0, 0)
				locked = TRUE
	else
		return