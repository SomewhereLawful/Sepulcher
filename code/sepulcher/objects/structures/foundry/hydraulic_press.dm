// Makes ingots into sheets
// Perhaps can make crude parts with different dies
/obj/structure/foundry/hydraulic_press
	name = "metal press"
	desc = "Flattens ingots into sheets. Appreciate from a distance."
	icon_state = "press"
	occupied = FALSE
	failure_message = "Your arm is within the recess as the press reaches the product. The limb is flattened, now useless."

/obj/structure/foundry/hydraulic_press/attackby(obj/item/O, mob/user, params)
	if(/obj/item/parts/ingot)
		if(occupied == TRUE)
			to_chat(user, "<span class='magenta'>It is already occupied.</span>")
			return
		else
			occupied = TRUE
			icon_state = "press_filled"
			occupying_item = /obj/item/parts/ingot
			qdel(O)

/obj/structure/foundry/hydraulic_press/attack_hand(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='magenta'>The machine confounds you. It's purpose and operation enigmatic.</span>")
		return

	var/mob/living/carbon/human/H = user
	var/accident_chance = (H.will * -0.2) + 10

	if(occupied == TRUE)
		visible_message("<span class='magenta'>The machine's bolster decends, flattening the contents within.</span>")
		occupied = FALSE
		flick("press_action",src)
		sleep(35) // length of flick
		icon_state = "press"
		new /obj/item/parts/sheet(get_turf(src))
		occupying_item = null
		
		if(prob(accident_chance)) // horrible industrial accident
			var/obj/item/bodypart/affecting = H.get_bodypart("[(user.active_hand_index % 2 == 0) ? "r" : "l" ]_arm")
			if(affecting && affecting.receive_damage(100))
				H.update_damage_overlays()
				to_chat(user, "[failure_message]")
				playsound(src, 'sound/effects/gib.ogg', 50, 0)

	else
		to_chat(user, "The machine is empty.")
		return