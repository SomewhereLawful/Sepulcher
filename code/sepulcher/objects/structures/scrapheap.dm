// Scrap pile
// Found outside city limits, proles go and pull parts out
// Risk of lacerating yourself, dependent on race (vagrants r dum) //

/obj/item/consumable/food/scrap
	name = "scrap piece"
	desc = "Some broken metal of unknown origin."
	icon_state = "scrap1"
	feed_points = 2
	health_points = 200 // eating sharp metal wrecks your organs
	foundry_metal_amt = 1

/obj/item/consumable/food/scrap/New()
	..()
	icon_state = "scrap[rand(1,2)]"

/obj/structure/scrapheap
	name = "scrapheap"
	desc = "Pile of metal from nowhere. Many pieces look sharp."
	icon = 'icons/obj/scrapheaps.dmi'
	icon_state = "scrap1"
	density = TRUE
	anchored = TRUE
	pixel_x = -16
	var/scrap_health = null

/obj/structure/scrapheap/New()
	..()
	icon_state = "scrap[rand(1,4)]"
	scrap_health = rand(3,5)

/obj/structure/scrapheap/attack_hand(mob/user)
	var/mob/living/carbon/human/H = user
	var/bleed_chance = 30
	var/drop_scrap_chance = 50
	var/scrap_grabbed_message = "<span class='red'>You jagged yourself, but you manage to obtain some scrap regardless.</span>"
	var/scrap_lost_message = "<span class='red'>You jagged yourself and lost grip on the scrap.</span>"

	// If it's empty
	if(scrap_health == 0)
		to_chat(user, "<span class='red'>The scrapheap is barren.</span>")
		return

	if(do_after(user, 20, target = src))
		playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
		to_chat(user, "You begin to sift through the metal.")

		if(isvagrant(H))
			bleed_chance = 30
		else if(isproletariat(H) || ishumanbasic(H))
			bleed_chance = 15

		if(prob(bleed_chance))
			H.bleed_rate = 5
			if(prob(drop_scrap_chance))
				to_chat(user, scrap_grabbed_message)
			else
				to_chat(user, scrap_lost_message)
				return

		// Obtain scrap and update heap status
		var/obj/item/consumable/food/scrap/S = new /obj/item/consumable/food/scrap
		user.put_in_active_hand(S)
		scrap_health--

		if(scrap_health == 0)
			name = "barren scrapheap"
			icon_state = "scrap_exhausted"
			desc = "Once a pile of metal. Nothing more."
			return

	else
		to_chat(user, "<span class='warning'>You stop pulling at the heap.</span>")
	..()

/obj/structure/scrapheap/attackby(obj/item/O, mob/user, params) // Instead of burning the excess, just put it back
	if(/obj/item/consumable/food/scrap)
		scrap_health++
		to_chat(user, "You toss the scrap into the pile.")
		playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
		qdel(O)
		if(scrap_health == 1)
			name = "scrapheap"
			desc = "Pile of metal from nowhere. Many pieces look sharp."
			icon_state = "scrap[rand(1,4)]"
