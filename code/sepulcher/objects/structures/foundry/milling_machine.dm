// used to make precision parts, but take time
// need to keep will stat high or chance of failure is high
/obj/structure/foundry/milling_machine
	name = "milling machine"
	desc = "Chisels into metal for precision artifice. Takes a steady hand and amicable willpower."
	icon_state = "milling"
	failure_message = "Your arm is still on the machine's knee, the drill rends your arm - leaving it damaged beyond repair."

/obj/structure/foundry/milling_machine/attackby(obj/item/O, mob/user, params)
	if(/obj/item/parts/ingot)
		if(occupied == FALSE)
			occupied = TRUE
			icon_state = "milling_filled"
			occupying_item = /obj/item/parts/ingot
			qdel(O)
		else
			to_chat(user, "<span class='magenta'>It is already occupied.</span>")
			return

/obj/structure/foundry/milling_machine/attack_hand(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='magenta'>The machine confounds you. It's purpose and operation enigmatic.</span>")
		return

	var/mob/living/carbon/human/H = user
	var/accident_chance = (H.will * -0.2) + 10
	if(H.has_trait(TRAIT_POOR_AIM))
		accident_chance += 10 // Trembling fingers make terrible mistakes

	if(occupied == TRUE)
		visible_message("<span class='magenta'>[user] begins to carefully carve an ingot to shape.</span>")
		flick("milling_action",src)
		playsound(src, 'sound/effects/steel_milling.ogg', 50, 0)
		if(do_after(user, 35, target = src))
			occupied = FALSE
			sleep(35) // length of flick
			icon_state = "milling"
			new /obj/item/parts/precision_part(get_turf(src))
			occupying_item = null

			// horrible industrial accident
			if(prob(accident_chance))
				var/obj/item/bodypart/affecting = H.get_bodypart("[(user.active_hand_index % 2 == 0) ? "r" : "l" ]_arm")
				if(affecting && affecting.receive_damage(100))
					H.update_damage_overlays()
					to_chat(user, "[failure_message]")
					playsound(src, 'sound/effects/gib.ogg', 50, 0)

	else
		to_chat(user, "The machine is empty.")
		return