// Sepulcher foodstuffs //
// No reagents, instead simply adjusts the hunger bar
// Some food gives special effects, but that should be the exception - and rarely should it be good

/obj/item/food
	name = "fucked up food"
	desc = "fucked up"
	icon = 'icons/obj/food.dmi'
	icon_state = "broken"
	/// Muliple of feed_points, also used to determine how many bites until the food is gone.
	var/food_volume = 3
	/// How much hunger is given per bite
	var/feed_points = 5
	/// Used for flavortext in eating /attack
	var/eatverb
	/// Use sparingly. Determines what item is generated upon total consumption of the food.
	var/trash = null


/obj/item/food/proc/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	var/mob/living/carbon/C = eater
	var/covered = ""
	if(C.is_mouth_covered(head_only = 1))
		covered = "headgear"
	else if(C.is_mouth_covered(mask_only = 1))
		covered = "mask"
	if(covered)
		var/who = (isnull(user) || eater == user) ? "your" : "[eater.p_their()]"
		to_chat(user, "<span class='warning'>You have to remove [who] [covered] first!</span>")
		return 0
	return 1

/obj/item/food/attack(mob/living/M, mob/living/user, def_zone)
	if(user.a_intent == INTENT_HARM)
		return ..()
	
	if(!eatverb)
		eatverb = pick("bite","chew","nibble","gnaw","gobble","chomp")
	if(!food_volume) //Shouldn't be needed but it checks to see if it has anything left in it.
		to_chat(user, "<span class='notice'>None of [src] left, oh no!</span>")
		qdel(src)
		return 0
	if(iscarbon(M))
		if(!canconsume(M, user))
			return 0

		if(M == user)								//If you're eating it yourself.
			if(M.hunger <= 40)
				user.visible_message("<span class='notice'>[user] hungrily takes a [eatverb] from \the [src], gobbling it down!</span>", "<span class='notice'>You hungrily take a [eatverb] from \the [src], gobbling it down!</span>")
			else if(M.hunger > 50)
				user.visible_message("<span class='notice'>[user] hungrily takes a [eatverb] from \the [src].</span>", "<span class='notice'>You hungrily take a [eatverb] from \the [src].</span>")
			else if(M.hunger > 70)
				user.visible_message("<span class='notice'>[user] takes a [eatverb] from \the [src].</span>", "<span class='notice'>You take a [eatverb] from \the [src].</span>")
			else if(M.hunger > 90)
				user.visible_message("<span class='notice'>[user] unwillingly takes a [eatverb] of a bit of \the [src].</span>", "<span class='notice'>You unwillingly take a [eatverb] of a bit of \the [src].</span>")
			else if(M.hunger == 100)
				user.visible_message("<span class='warning'>[user] cannot force any more of \the [src] to go down [user.p_their()] throat!</span>", "<span class='warning'>You cannot force any more of \the [src] to go down your throat!</span>")
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
		
		if(food_volume)	//Handle ingestion of the item.
			playsound(M.loc,'sound/items/eatfood.ogg', rand(10,50), 1)
			if(food_volume >= 0)
				food_volume--
				M.adjustHunger(feed_points)
			if(food_volume == 0)
				SEND_SIGNAL(src, COMSIG_FOOD_EATEN, M, user)
				On_Consume(M)
				return 1
	return 0

/obj/item/food/proc/On_Consume(mob/living/eater)
	if(!eater)
		return
		var/obj/item/trash_item = generate_trash(eater)
		qdel(src)
		eater.put_in_hands(trash_item)

/obj/item/food/proc/generate_trash(atom/location)
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

/obj/item/food/attack_self(mob/user)
	return

/obj/item/food/goyslop
	name = "food pack"
	desc = "Staple food of bioslave and the proletariat. Tasteless."
	icon_state = "goyslop"
	feed_points = 20

/obj/item/food/abortion
	name = "failed abortion"
	desc = "Waste not, want not."
	feed_points = 25

/obj/item/food/thinhelmet
	name = "thin helmet"
	desc = "Cultivate of shitheaps. Used in food packs."
	feed_points = 5

/obj/item/food/sinew
	name = "sinew strand"
	desc = "Grown on shitheaps. Used for sutures."
	feed_points = 3
