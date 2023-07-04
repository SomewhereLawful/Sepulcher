// Sepulcher foodstuffs //
// No reagents, instead simply adjusts the hunger bar
// Some food gives special effects, but that should be the exception - and rarely should it be good

/obj/item/consumable
	name = "fucked up consumable"
	desc = "fucked up"
	icon = 'icons/obj/food.dmi'
	icon_state = "broken"
	/// Health added/lost when consumed
	var/health_points = 0
	/// Percentage of total hunger given when eaten
	var/feed_points = 0
	/// How much will is lost
	var/will_points = 0
	/// How much toxicity is given
	var/toxicity_points = 0
	/// Sound when the food is eaten
	var/eat_sound = 'sound/items/food_crunchy_1.ogg'
	/// Use sparingly. Determines what item is generated upon total consumption of the food.
	var/trash = null
	var/cooking_product = null
	/// For mouth/face cover check. If TRUE, checks.
	var/ingest_consumption = TRUE
	// string stuff for visiblemessage
	var/uses_verb = "uses"
	var/use_verb = "use"
	/// Description of eating the item for the user, predominantly taste and texture.
	var/flavour_text = null

/obj/item/consumable/burn()
	if(!cooking_product == null)
		visible_message("[src] finishes cooking!")
		new cooking_product(loc)
		qdel(src)

/obj/item/consumable/proc/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	var/mob/living/carbon/C = eater
	var/covered = ""
	if(C.is_mouth_covered(head_only = 1))
		covered = "headgear"
	else if(C.is_mouth_covered(mask_only = 1))
		covered = "mask"
	if(ingest_consumption == TRUE)
		if(covered)
			var/who = (isnull(user) || eater == user) ? "your" : "[eater.p_their()]"
			to_chat(user, "<span class='warning'>You have to remove [who] [covered] first.</span>")
			return 0
	else return 1
	return 1

/obj/item/consumable/attack(mob/living/M, mob/living/user, def_zone)
	if(user.a_intent == INTENT_HARM)
		return ..()
	
	if(iscarbon(M))
		if(!canconsume(M, user))
			return 0

		if(M == user)								//If you're eating it yourself.
			if(M.hunger == 100)
				user.visible_message("<span class='warning'>[user] fails to force \the [src] down [user.p_their()] maw!</span>", "<span class='warning'>You fail to force \the [src] down your maw!</span>")
				return 0
		else
			if(!isbrain(M))		//If you're feeding it to someone else.
				if(M.hunger <= 50)
					M.visible_message("<span class='danger'>[user] attempts to feed [M] [src].</span>", \
										"<span class='userdanger'>[user] attempts to feed [M] [src].</span>")
				else
					M.visible_message("<span class='warning'>[user] cannot force any more of [src] down [M]'s throat!</span>", \
										"<span class='warning'>[user] cannot force any more of [src] down [M]'s throat!</span>")
					return 0

				if(!do_mob(user, M))
					return
				M.visible_message("<span class='danger'>[user] forces [M] to eat [src].</span>", \
									"<span class='userdanger'>[user] forces [M] to eat [src].</span>")

			else
				to_chat(user, "<span class='warning'>[M] doesn't seem to have a mouth!</span>")
				return

//Handle ingestion of the item.
		playsound(M.loc, eat_sound, 60)
		M.adjustHunger(feed_points *= 10)
		M.adjustBruteLoss(health_points)		
		M.adjustWillLoss(will_points)
		M.adjustToxicityGain(toxicity_points)

		SEND_SIGNAL(src, COMSIG_FOOD_EATEN, M, user)
		On_Consume(M)
		qdel(src)

		user.visible_message("[user] [uses_verb] \the [src].", "<span class='magenta'>You [use_verb] \the [src].</span>")
		if(flavour_text)
			to_chat(user, flavour_text)

		return 1
	return 0

/obj/item/consumable/proc/On_Consume(mob/living/eater)
	if(!eater)
		return
		var/obj/item/trash_item = generate_trash(eater)
		qdel(src)
		eater.put_in_hands(trash_item)

/obj/item/consumable/proc/generate_trash(atom/location)
	if(trash)
		if(ispath(trash, /obj/item))
			. = new trash(location)
			trash = null
			return
		else if(isitem(trash))
			var/obj/item/trash_item = trash
			trash_item.forceMove(location)
			. = trash
			trash = null
			return

/obj/item/consumable/attack_self(mob/user)
	return
