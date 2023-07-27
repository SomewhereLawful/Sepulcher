
/obj/structure/foundry/steel_bucket
	name = "steel bucket"
	desc = "Capable of holding liquid steel - withstanding the foundry maw heat."
	icon_state = "steel_bucket"
	anchored = FALSE
	var/filled = FALSE
	var/list/allowed_turfs = list(/turf/open/chasm/foundry,/turf/open/foundry)

/obj/structure/foundry/steel_bucket/Move(newloc, direct)
	if(!isturf(newloc) ||  moving_diagonally || get_dist(get_step(src,dir),get_turf(src)) > 1)
		return 0
	else
		return ..()

/obj/structure/foundry/steel_bucket/examine(mob/user)
	..()
	to_chat(user, "<span class='red'>A chain hangs from the side, allowing you to pull it into the maw. Go slowly.</span>")
	if(filled == TRUE)
		to_chat(user, "<span class='red'>It is filled to the brim with liquid steel.</span>")

/obj/structure/foundry/steel_bucket/attack_hand(mob/user)
	if(filled == TRUE)
		to_chat(user, "You pull the chain, the steel pours.")
		flick("bucket_draining",src)
		filled = FALSE
		icon_state = "steel_bucket"
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
	if(filled == TRUE)
		to_chat(user, "The bucket is already filled.")
		return
	else
		flick("bucket_filling",src)
		to_chat(user, "<span class='red'>The bucket decends into the desolation, retrieving liquid steel from the maw.</span>")
		filled = TRUE
		icon_state = "filled_bucket"

/obj/structure/foundry/mould
	name = "ingot mould"
	desc = "Pour steel, make ingots."
	icon_state = "mould_closed"
	density = FALSE
	var/opened = FALSE
	var/filled = FALSE

/obj/structure/foundry/mould/examine(mob/user)
	..()
	if(filled == TRUE)
		to_chat(user, "<span class='red'>It is filled with liquid steel, ingots forming.</span>")

/obj/structure/foundry/mould/attack_hand(mob/user)
	if(opened == FALSE)
		to_chat(user, "You open the mould, revealing the contents.")
		icon_state = "mould_open"
		opened = TRUE
		if(filled == TRUE) // Three ingots
			new /obj/item/ingot(get_turf(src))
			new /obj/item/ingot(get_turf(src))
			new /obj/item/ingot(get_turf(src))
	else
		to_chat(user, "You close the mould.")
		icon_state = "mould_closed"
		opened = FALSE
