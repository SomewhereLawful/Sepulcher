
/obj/structure/foundry/steel_bucket
	name = "steel bucket"
	desc = "Capable of holding liquid steel - withstanding the foundry maw heat."
	icon_state = "steel_bucket"
	anchored = FALSE
	var/list/allowed_turfs = list(/turf/open/chasm/foundry,/turf/open/foundry)

/obj/structure/foundry/steel_bucket/Move(newloc, direct)
	if(!isturf(newloc) ||  moving_diagonally || get_dist(get_step(src,dir),get_turf(src)) > 1)
		return 0
	else
		return ..()

/obj/structure/foundry/steel_bucket/examine(mob/user)
	..()
	to_chat(user, "<span class='red'>A chain hangs from the side, allowing you to pull it into the maw. Go slowly.</span>")
	if(occupied == TRUE)
		to_chat(user, "<span class='red'>It is filled to the brim with liquid steel.</span>")

/obj/structure/foundry/steel_bucket/attack_hand(mob/user)
	if(occupied == TRUE)
		to_chat(user, "You pull the chain, the steel pours.")
		flick("bucket_draining",src)
		sleep(28) // length of flick
		occupied = FALSE
		icon_state = "steel_bucket"
		for(var/obj/structure/foundry/mould/M in range(1, src))
			if(M.Adjacent(src) && ((get_dir(src, M) & dir) || M.loc == loc)) //we can reach it and it's in front of us? grab it!
				M.occupied = TRUE
	else
		to_chat(user, "The bucket is empty.")
		return

/*
/obj/structure/foundry/steel_bucket/attack_hand(mob/user)
	var/obj/structure/foundry/mould/M
	if(filled == TRUE)
		to_chat(user, "You pull the chain, the steel pours.")
		flick("bucket_draining",src)
		if(M in src.loc.contents)
			if(M.filled == TRUE)
				to_chat(user, "<span class='red'>The mould already has steel within it. The excess is lost back to the maw.</span>")
				return
			if(M.filled == FALSE)
				to_chat(user, "<span class='red'>The steel pours into the mould.</span>")
				M.filled = TRUE
		filled = FALSE
		icon_state = "steel_bucket"
	else
		to_chat(user, "The bucket is empty.")
		return
*/

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
