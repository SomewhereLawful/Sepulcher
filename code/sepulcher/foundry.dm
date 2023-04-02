// Foundry //
// Use scrap to make weapons, some clothing, or other commodities
/obj/item/ingot
	name = "steel ingot"
	desc = "Hammers of iron beget sickles of steel."
	icon = 'icons/obj/foundry.dmi'
	icon_state = "ingot"

/obj/structure/foundry
	name = "foundry machine"
	desc = "A machine of spectral machination."
	icon = 'icons/obj/foundry.dmi'
	density = TRUE
	anchored = TRUE

/obj/structure/foundry/steel_bucket
	name = "steel bucket"
	desc = "Capable of holding liquid steel - withstanding the foundry maw heat."
	icon_state = "steel_bucket"
	anchored = FALSE
	var/filled = FALSE
	var/list/allowed_turfs = list(/turf/open/chasm/foundry,/turf/open/foundry)

/obj/structure/foundry/steel_bucket/examine(mob/user)
	to_chat(user, "<span class='red'>A chain hangs from the side, allowing you to pull it to the molds. Go slowly.</span>")
	. = ..()

/obj/structure/foundry/steel_bucket/attack_hand(mob/user)
	if(filled == TRUE)
		to_chat(user, "You pull the chain, the molten steel pours out.")
		flick("bucket_draining",src)
		filled = FALSE

/obj/structure/foundry/mould // Should make about 3 ingots
	name = "ingot mould"
	desc = "Pour steel, make ingots. The median of manufacturing."
	icon_state = "mould_closed"
	var/opened = FALSE
	var/filled = FALSE

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