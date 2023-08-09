// makes sheets into pipes or barrels for guns
// higher accident chance
/obj/structure/foundry/lathe
	name = "lathe"
	desc = "Spin and carve new artifices. Additionally allows sheets to be made into pipes."
	icon_state = "lathe"
	failure_message = "Your arm is caught by the lathe. The spin's power tears your arm from the shoulder."

/obj/structure/foundry/lathe/attackby(obj/item/O, mob/user, params)
	if(/obj/item/ingot)
		if(occupied == TRUE)
			to_chat(user, "<span class='warning'>It is already occupied.</span>")
			return
		else
			occupied = TRUE
			icon_state = "milling_filled"
			qdel(O)

/obj/structure/foundry/lathe/attack_hand(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>The machine confounds you. It's purpose and operation enigmatic.</span>")
		return

	var/mob/living/carbon/human/H = user
	var/accident_chance = (H.will * -0.2) + 30

	if(H.has_trait(TRAIT_POOR_AIM))
		accident_chance += 10 // Trembling fingers make terrible mistakes

	if(occupied == TRUE)
		visible_message("<span class='magenta'>[user] begins to carefully carve an ingot to shape.</span>")
		flick("milling_action",src)
		playsound(src, 'sound/effects/steel_milling.ogg', 50, 0)
		if(do_after(user, 20, target = src))
			occupied = FALSE
			sleep(35) // length of flick
			icon_state = "milling"
			new /obj/item/ingot/precision_part(get_turf(src))

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