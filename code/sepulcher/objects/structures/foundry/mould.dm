// For filling action, check steel_bucket
/obj/structure/foundry/mould
	name = "ingot mould"
	desc = "Pour steel, make ingots."
	icon_state = "mould_closed"
	density = FALSE
	pixel_y = -16

	var/opened = FALSE
	var/cooling = FALSE
	var/cooling_time = 0
	var/cooling_duration = 60
	var/output_dir = SOUTH

// Sorry for future coders finding this
/obj/structure/foundry/mould/Initialize()
	. = ..()
	START_PROCESSING(SSmachines, src)

/obj/structure/foundry/mould/Destroy()
	STOP_PROCESSING(SSmachines, src)
	return ..()	

/obj/structure/foundry/mould/process()
	if(cooling == TRUE)
		if(world.time - cooling_time >= cooling_duration)
			ingot_cooling_end()

/obj/structure/foundry/mould/examine(mob/user)
	..()
	if(occupied == TRUE && cooling == TRUE)
		to_chat(user, "<span class='red'>It is filled with liquid steel, ingots forming.</span>")
	else if(occupied == TRUE && cooling == TRUE)
		to_chat(user, "<span class='red'>It contains ingots ready for artifice.</span>")

/obj/structure/foundry/mould/attack_hand(mob/user)
	var/turf/T = get_step(src,output_dir) // So ingots spawn south of the box

	if(cooling == TRUE)
		to_chat(user, "<span class='magenta'>The ingots within are still cooling. You stay your hand.</span>")
		return
	else
		if(opened == FALSE && cooling == FALSE)
			to_chat(user, "You open the mould, revealing the contents.")
			icon_state = "mould_open"
			opened = TRUE
			if(occupied == TRUE) // Three ingots
				new /obj/item/ingot(T)
				new /obj/item/ingot(T)
				new /obj/item/ingot(T)
		else
			to_chat(user, "You close the mould.")
			icon_state = "mould_closed"
			opened = FALSE

/obj/structure/foundry/mould/proc/ingot_cooling_start()
	icon_state = "mould_filled_cooling"
	cooling_time = world.time

/obj/structure/foundry/mould/proc/ingot_cooling_end()
	cooling = FALSE
	cooling_time = null
	icon_state = "mould_filled_cool"
