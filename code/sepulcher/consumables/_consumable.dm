// Sepulcher foodstuffs //
// No reagents, instead simply adjusts the hunger bar
// Some food gives special effects, but that should be the exception - and rarely should it be good
// Code will need to be eventually culled down

/obj/item/consumable
	name = "fucked up consumable"
	desc = "fucked up"
	icon = 'icons/obj/food.dmi'
	icon_state = "broken"
	/// How is this consumed? - SKIN checks if covered, VAGUE is consumed regardless of covering
	var/consume_type = VAGUE_CONSUME
	var/use_sound = 'sound/items/food_crunchy_1.ogg'
	var/uses_verb = "uses"
	var/use_verb = "use"
	var/uses_left = 1

	// The meat and potatoes
	var/health_points = 0
	var/feed_points = 0
	var/will_points = 0
	var/toxicity_points = 0
	var/bleed_suppression = 0
	var/drunk_points = 0
	/// Cures the declared parasite
	var/cures_parasite = null

	var/byproduct_item = null

/obj/item/consumable/proc/canconsume(mob/consumer, mob/user)
	if(!iscarbon(consumer))
		return 0
	var/mob/living/carbon/C = consumer
	var/covered = ""
	switch(consume_type)
		if(MOUTH_CONSUME)
			if(C.is_mouth_covered(head_only = 1))
				covered = "headgear"
			else if(C.is_mouth_covered(mask_only = 1))
				covered = "mask"
			if(covered)
				var/who = (isnull(user) || consumer == user) ? "your" : "[consumer.p_their()]"
				to_chat(user, "<span class='warning'>You have to remove [who] [covered] first.</span>")
				return 0
			else return 1
		if(SKIN_CONSUME)
			var/obj/item/bodypart/affecting
			affecting = C.get_bodypart(check_zone(user.zone_selected))
			if(!affecting) // Missing limb?
				to_chat(user, "<span class='warning'>[C] doesn't have \a [parse_zone(user.zone_selected)]!</span>")
				return 0
			if(!get_location_accessible(C, user.zone_selected)) // Check if clothing is in the way
				to_chat(user, "<span class='warning'>There is clothing in the way.</span>")
				return 0
			return 1
		if(VAGUE_CONSUME)
			return 1
	return 1

/obj/item/consumable/attack(mob/living/M, mob/living/user, def_zone)
	if(user.a_intent == INTENT_HARM)
		return ..()
	
	if(iscarbon(M))
		if(!canconsume(M, user))
			return 0

		if(consume_type & MOUTH_CONSUME)
			if(M == user)								//If you're eating it yourself.
				if(M.hunger < M.maxHunger * 0.9)
					user.visible_message("<span class='warning'>[user] fails to force \the [src] down [user.p_their()] maw!</span>", "<span class='warning'>You fail to force \the [src] down your maw!</span>")
					return 0
			else
				if(!isbrain(M))		//If you're feeding it to someone else.
					if(M.hunger <= (M.maxHunger*0.5))
						M.visible_message("<span class='danger'>[user] attempts to feed [M] [src].</span>", \
											"<span class='userdanger'>[user] attempts to feed [M] [src].</span>")
					else
						M.visible_message("<span class='warning'>[user] cannot force any more of [src] down [M]'s throat.</span>", \
											"<span class='warning'>[user] cannot force any more of [src] down [M]'s throat.</span>")
						return 0

					if(!do_mob(user, M))
						return
					M.visible_message("<span class='danger'>[user] forces [M] to eat [src].</span>", \
										"<span class='userdanger'>[user] forces [M] to eat [src].</span>")
				else
					to_chat(user, "<span class='warning'>[M] doesn't seem to have a mouth!</span>")
					return 0

//Handle ingestion of the item.
		playsound(M.loc, use_sound, 60)
		M.adjustHunger(feed_points *= 10)
		M.adjustBruteLoss(health_points)		
		M.adjustWillLoss(will_points)
		M.adjustToxicityGain(toxicity_points)

		var/mob/living/carbon/C = M
		var/mob/living/carbon/human/H = M // I hate it here
		C.drunkenness = max((C.drunkenness + drunk_points),0) 
		H.suppress_bloodloss(bleed_suppression)
		SEND_SIGNAL(src, COMSIG_FOOD_EATEN, M, user)
		--uses_left

		if(uses_left <= 0) // actually finish the food
			On_Consume(M)
			qdel(src)

		user.visible_message("[user] [uses_verb] \the [src].", "<span class='magenta'>You [use_verb] \the [src].</span>")
		return 1
	return 0

/obj/item/consumable/proc/On_Consume(mob/living/consumer)
	if(!consumer)
		return
		var/obj/item/byproduct_item_selection = generate_byproduct(consumer)
		qdel(src)
		consumer.put_in_hands(byproduct_item_selection)

/obj/item/consumable/proc/generate_byproduct(atom/location)
	if(byproduct_item)
		if(ispath(byproduct_item, /obj/item))
			. = new byproduct_item(location)
			byproduct_item = null
			return
		else if(isitem(byproduct_item))
			var/obj/item/byproduct_item_selection = byproduct_item
			byproduct_item_selection.forceMove(location)
			. = byproduct_item
			byproduct_item = null
			return

/obj/item/consumable/attack_self(mob/user)
	return
