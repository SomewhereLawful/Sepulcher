// Basic ladder. By default links to the z-level above/below.
/obj/structure/ladder
	name = "ladder"
	desc = "A sturdy metal ladder."
	icon = 'icons/obj/structures.dmi'
	icon_state = "manhole_closed"
	anchored = TRUE
	var/obj/structure/ladder/down   //the ladder below this one
	var/obj/structure/ladder/up     //the ladder above this one
	var/obj/item/twohanded/required/manhole/cover //the cover for this manhole
	var/manhole_cover = FALSE

/obj/structure/ladder/Initialize(mapload, obj/structure/ladder/up, obj/structure/ladder/down)
	..()
	if(manhole_cover)
		cover = new /obj/item/twohanded/required/manhole
	if (up)
		src.up = up
		up.down = src
		up.update_icon()
	if (down)
		src.down = down
		down.up = src
		down.update_icon()
	return INITIALIZE_HINT_LATELOAD

/obj/structure/ladder/Destroy(force)
	if ((resistance_flags & INDESTRUCTIBLE) && !force)
		return QDEL_HINT_LETMELIVE
	disconnect()
	return ..()

/obj/structure/ladder/LateInitialize()
	// By default, discover ladders above and below us vertically
	var/turf/T = get_turf(src)
	var/obj/structure/ladder/L

	if (!down)
		L = locate() in SSmapping.get_turf_below(T)
		if (L)
			down = L
			L.up = src  // Don't waste effort looping the other way
			L.update_icon()
	if (!up)
		L = locate() in SSmapping.get_turf_above(T)
		if (L)
			up = L
			L.down = src  // Don't waste effort looping the other way
			L.update_icon()

	update_icon()

/obj/structure/ladder/proc/disconnect()
	if(up && up.down == src)
		up.down = null
		up.update_icon()
	if(down && down.up == src)
		down.up = null
		down.update_icon()
	up = down = null

/obj/structure/ladder/update_icon()
	if(cover)
		icon_state = "manhole_closed"
	else
		if(up && down)
			icon_state = "ladder-middle"

		else if(up)
			icon_state = "ladder-bottom"

		else if(down)
			icon_state = "manhole_open"

		else	//wtf make your ladders properly assholes
			icon_state = "ladder-error"

/obj/structure/ladder/singularity_pull()
	if (!(resistance_flags & INDESTRUCTIBLE))
		visible_message("<span class='danger'>[src] is torn to pieces by the gravitational pull!</span>")
		qdel(src)

/obj/structure/ladder/proc/travel(going_up, mob/user, is_ghost, obj/structure/ladder/ladder)
	if(!is_ghost)
		show_fluff_message(going_up, user)
		ladder.add_fingerprint(user)

	var/turf/T = get_turf(ladder)
	var/atom/movable/AM
	if(user.pulling)
		AM = user.pulling
		AM.forceMove(T)
	user.forceMove(T)
	if(AM)
		user.start_pulling(AM)

/obj/structure/ladder/proc/use(mob/user, is_ghost=FALSE)
	if (!is_ghost && !in_range(src, user))
		return

	if(cover)
		to_chat(user, "<span class='red'>There is a cover in the way.</span>")
		return

	if (up && down)
		var/result = alert("Go up or down [src]?", "Ladder", "Up", "Down", "Cancel")
		if (!is_ghost && !in_range(src, user))
			return  // nice try
		switch(result)
			if("Up")
				travel(TRUE, user, is_ghost, up)
			if("Down")
				travel(FALSE, user, is_ghost, down)
			if("Cancel")
				return
	else if(up)
		travel(TRUE, user, is_ghost, up)
	else if(down)
		travel(FALSE, user, is_ghost, down)
	else
		to_chat(user, "<span class='warning'>[src] doesn't seem to lead anywhere!</span>")

	if(!is_ghost)
		add_fingerprint(user)

/obj/structure/ladder/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	use(user)

/obj/structure/ladder/attack_paw(mob/user)
	return use(user)

/obj/structure/ladder/attackby(obj/item/W, mob/user, params)
	var/mob/living/carbon/human/H = user
	if(/obj/item/twohanded/melee/whale_hook && cover)
		if(!cover)
			to_chat(user, "<span class='magenta'>There's nothing to obstructing this manhole.</span>")
			return
		else
			H.visible_message("<span class='red'>[H] begins to pull the [cover.name] from the [name].</span>", \
								"<span class='red'>You begins to pull the [cover.name] from the [name].</span>")
			if(do_after(H, rand(5,8) SECONDS, target = src))
				user.dropItemToGround(cover)
				cover = null
				update_icon()
				playsound(src, 'sound/effects/manhole_move.ogg', 50, 0, 0)
				to_chat(user, "<span class='magenta'>You pull off the [cover.name].</span>")

	if(/obj/item/twohanded/required/manhole)
		if(!cover)
			if(up)
				to_chat(user, "<span class='magenta'>The [name] lacks a place for the [W.name].</span>")
				return
			H.visible_message("<span class='red'>[H] begins to place a cover on the [name].</span>", \
								"<span class='red'>You begins to place a cover on the [name].</span>")
			if(do_after(H, rand(2,4) SECONDS, target = src))
				if(!user.transferItemToLoc(W, src))
					return
				cover = W
				update_icon()
				playsound(src, 'sound/effects/manhole_move.ogg', 50, 0, 0)
				to_chat(user, "<span class='magenta'>You place the [W.name] on the [name].</span>")
		else
			to_chat(user, "<span class='magenta'>There is already a cover in place.</span>")
			return
	else
		return use(user)

/obj/structure/ladder/attack_robot(mob/living/silicon/robot/R)
	if(R.Adjacent(src))
		return use(R)

//ATTACK GHOST IGNORING PARENT RETURN VALUE
/obj/structure/ladder/attack_ghost(mob/dead/observer/user)
	use(user, TRUE)
	return ..()

/obj/structure/ladder/proc/show_fluff_message(going_up, mob/user)
	if(going_up)
		user.visible_message("[user] climbs up [src].","<span class='notice'>You climb up [src].</span>")
	else
		user.visible_message("[user] climbs down [src].","<span class='notice'>You climb down [src].</span>")


// Indestructible away mission ladders which link based on a mapped ID and height value rather than X/Y/Z.
/obj/structure/ladder/unbreakable
	name = "manhole"
	desc = "A portal to a dizzying realm of shit and sepsis."
	resistance_flags = INDESTRUCTIBLE
	var/id
	var/height = 0  // higher numbers are considered physically higher

/obj/structure/ladder/unbreakable/Initialize()
	GLOB.ladders += src
	return ..()

/obj/structure/ladder/unbreakable/Destroy()
	. = ..()
	if (. != QDEL_HINT_LETMELIVE)
		GLOB.ladders -= src

/obj/structure/ladder/unbreakable/LateInitialize()
	// Override the parent to find ladders based on being height-linked
	if (!id || (up && down))
		update_icon()
		return

	for (var/O in GLOB.ladders)
		var/obj/structure/ladder/unbreakable/L = O
		if (L.id != id)
			continue  // not one of our pals
		if (!down && L.height == height - 1)
			down = L
			L.up = src
			L.update_icon()
			if (up)
				break  // break if both our connections are filled
		else if (!up && L.height == height + 1)
			up = L
			L.down = src
			L.update_icon()
			if (down)
				break  // break if both our connections are filled

	update_icon()

/obj/structure/ladder/unbreakable/binary
	name = "mysterious ladder"
	desc = "Where does it go?"
	height = 0
	id = "lavaland_binary"
	var/area_to_place = /area/lavaland/surface/outdoors
	var/active = FALSE

/obj/structure/ladder/unbreakable/binary/proc/ActivateAlmonds()
	if(area_to_place && !active)
		var/turf/T = getTargetTurf()
		if(T)
			var/obj/structure/ladder/unbreakable/U = new (T)
			U.id = id
			U.height = height+1
			LateInitialize() // LateInit both of these to build the links. It's fine.
			U.LateInitialize()
			for(var/turf/TT in range(2,U))
				TT.TerraformTurf(/turf/open/indestructible/binary, /turf/open/indestructible/binary, CHANGETURF_INHERIT_AIR)
		active = TRUE

/obj/structure/ladder/unbreakable/binary/proc/getTargetTurf()
	var/list/turfList = get_area_turfs(area_to_place)
	while (turfList.len && !.)
		var/i = rand(1, turfList.len)
		var/turf/potentialTurf = turfList[i]
		if (is_centcom_level(potentialTurf.z)) // These ladders don't lead to centcom.
			turfList.Cut(i,i+1)
			continue
		if(!istype(potentialTurf, /turf/open/lava) && !potentialTurf.density)			// Or inside dense turfs or lava
			var/clear = TRUE
			for(var/obj/O in potentialTurf) // Let's not place these on dense objects either. Might be funny though.
				if(O.density)
					clear = FALSE
					break
			if(clear)
				. = potentialTurf
		if (!.)
			turfList.Cut(i,i+1)

/obj/structure/ladder/unbreakable/binary/space
	id = "space_binary"
	area_to_place = /area/space

/obj/structure/ladder/unbreakable/binary/unlinked //Crew gets to complete one
	id = "unlinked_binary"
	area_to_place = null
