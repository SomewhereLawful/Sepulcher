
/obj/structure/foundry/mould
	name = "ingot mould"
	desc = "Pour steel, make ingots."
	icon_state = "mould_closed"
	density = FALSE
	var/opened = FALSE

/obj/structure/foundry/mould/examine(mob/user)
	..()
	if(occupied == TRUE)
		to_chat(user, "<span class='red'>It is filled with liquid steel, ingots forming.</span>")

/obj/structure/foundry/mould/attack_hand(mob/user)
	if(opened == FALSE)
		to_chat(user, "You open the mould, revealing the contents.")
		icon_state = "mould_open"
		opened = TRUE
		if(occupied == TRUE) // Three ingots
			new /obj/item/ingot(get_turf(src))
			new /obj/item/ingot(get_turf(src))
			new /obj/item/ingot(get_turf(src))
	else
		to_chat(user, "You close the mould.")
		icon_state = "mould_closed"
		opened = FALSE
