/obj/structure/foundry/steel_bucket
	name = "steel bucket"
	desc = "Suspended above the foundry maw. The chain is a pulley, allowing the vessel to decend."
	icon_state = "steel_bucket"
	anchored = FALSE
	pixel_y = 8

/obj/structure/foundry/steel_bucket/Move(newloc, direct)
	if(!isturf(newloc) || get_dist(get_step(src,dir),get_turf(src)) > 1)
		return 0
	else
		return ..()

/obj/structure/foundry/steel_bucket/examine(mob/user)
	..()
	to_chat(user, "<span class='red'>Alt-Click to fill the bucket. It must be unobstructed above the maw.</span>")
	if(occupied == TRUE)
		to_chat(user, "<span class='red'>It is filled to the brim with liquid steel.</span>")

/obj/structure/foundry/steel_bucket/attack_hand(mob/user)
	if(occupied == TRUE)
		to_chat(user, "You pull the chain, the steel pours.")
		flick("bucket_draining",src)
		sleep(28) // length of flick
		occupied = FALSE
		icon_state = "steel_bucket"

		// This block checks if src is on the same turf as the mould, if so - the mould is "filled"
		for(var/obj/structure/foundry/mould/M in range(0, src))
			if(M.Adjacent(src) && ((get_dir(src, M) & dir) || M.loc == loc))
				M.occupied = TRUE
				M.icon_state = "mould_filled"
	else
		to_chat(user, "The bucket is empty.")
		return

/obj/structure/foundry/steel_bucket/AltClick(mob/user)
	. = ..()
	if(occupied == TRUE)
		to_chat(user, "The bucket is already filled.")
		return
	else
		to_chat(user, "<span class='red'>The bucket decends into the desolation, retrieving liquid steel from the maw.</span>")
		flick("bucket_filling",src)
		sleep(49) // length of flick
		occupied = TRUE
		icon_state = "filled_bucket"
