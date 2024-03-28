/obj/item/fishing_rod
	name = "fishing rod"
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_rod"
	var/in_use = FALSE

/obj/item/fishing_rod/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(in_use)
		to_chat(user, "<span class='red'>You are already fishing.</span>")
		return
	in_use = TRUE

	if(istype(target, /obj/structure/fishing_spot))
		if(!do_after(user, rand(10,20) SECONDS, target = target))
			in_use = FALSE
			return
		var/obj/structure/fishing_spot/W = target
		var/chosen_fish = pickweight(W.fish_list)
		new chosen_fish(get_turf(user))
		to_chat(user, "<span class='red'>You have caught something.</span>")
		W.spot_life--

		if(W.spot_life <= 1)
			to_chat(user, "<span class='red'>The fishing spot exhausts, melting back into the water.</span>")
			playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
			qdel(W)

		// FOR FISHING SPOT SPRITES
		// Not the best code, I'm sure
		if(W.spot_life >= 4)
			W.icon_state = "fishing_spot_life_3"
		else if(W.spot_life == 3)
			W.icon_state = "fishing_spot_life_2"
		else if(W.spot_life == 2)
			W.icon_state = "fishing_spot_life_1"

	in_use = FALSE


// Dragline stuff
/obj/item/fishing_net
	name = "fishing net"
	desc = "Binding artifice, connect to a water-bound support to passively collect common fish."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_net"
