// makes sheets into pipes or barrels for guns
// higher accident chance
/obj/structure/foundry/lathe
	name = "lathe"
	desc = "Spin and carve new artifices. Additionally allows sheets to be made into pipes."
	icon_state = "lathe"
	failure_message = "Your arm is caught by the lathe. The spin's power tears your arm from the shoulder."

/obj/structure/foundry/lathe/attackby(obj/item/O, mob/user, params)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='magenta'>The machine confounds you. It's purpose and operation enigmatic.</span>")
		return

	if(occupied == FALSE)
		if(istype(O, /obj/item/parts/ingot))
			output_item = /obj/item/parts/crude_part
			icon_state = "lathe_ingot"
			occupying_item = O
			occupied = TRUE
			qdel(O)

		else if(istype(O, /obj/item/parts/sheet))
			output_item = /obj/item/melee/pipe
			icon_state = "lathe_sheet"
			occupying_item = O
			occupied = TRUE
			qdel(O)

		else
			to_chat(user, "<span class='magenta'>This cannot be used.</span>")
			return
	else
		to_chat(user, "<span class='magenta'>It is already occupied.</span>")
		return

/obj/structure/foundry/lathe/attack_hand(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='magenta'>The machine confounds you. It's purpose and operation enigmatic.</span>")
		return

	var/mob/living/carbon/human/H = user
	var/accident_chance = (H.will * -0.2) + 30
	if(H.has_trait(TRAIT_POOR_AIM))
		accident_chance += 10 // Trembling fingers make terrible mistakes

	if(occupied == TRUE)
		if(do_after(user, 20, target = src))
			switch(icon_state)
				if("lathe_ingot")
					flick("press_action",src)
					sleep(35) // length of flick

				if("lathe_sheet")
					flick("press_action",src)
					sleep(35) // length of flick

			occupied = FALSE
			icon_state = "lathe"
			new output_item(get_turf(src))

			if(occupied == FALSE)
				output_item = null

			// horrible industrial accident
			if(prob(accident_chance))
				var/obj/item/bodypart/affecting = H.get_bodypart("[(user.active_hand_index % 2 == 0) ? "r" : "l" ]_arm")
				if(affecting && affecting.receive_damage(100))
					H.update_damage_overlays()
					to_chat(user, "[failure_message]")
					playsound(src, 'sound/effects/gib.ogg', 50, 0)
		else
			to_chat(user, "<span class='magenta'>You are interrupted.</span>")
			return
	else
		to_chat(user, "The machine is empty.")
		return