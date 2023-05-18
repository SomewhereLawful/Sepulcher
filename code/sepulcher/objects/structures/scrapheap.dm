// Scrap pile
// Found outside city limits, Bioslaves or proles go and pull parts out
// Risk of lacerating yourself, dependent on position (bioslave (highest) - prole (lowest) //

/obj/item/consumable/scrap
	name = "scrap piece"
	desc = "Some broken metal of unknown origin."
	icon_state = "scrap1"
	feed_points = 2

/obj/item/consumable/scrap/New()
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
	if(scrap_health == 0)
		to_chat(user, "<span class='red'>The scrapheap is barren.</span>")
		return
	if(do_after(user, 20, target = src))
		playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
		to_chat(user, "You begin to sift through the metal.")
		if(isbioslave(H) || isvagrant(H))
			if(prob(30))
				H.bleed_rate = 5
				if(prob(50))
					to_chat(user, "<span class='red'>You jagged yourself, but you manage to obtain some scrap regardless.</span>")
				else
					to_chat(user, "<span class='red'>You jagged yourself and lost grip on the scrap.</span>")
					return		
		if(isproletariat(H) || ishumanbasic(H))
			if(prob(15))
				H.bleed_rate = 5
				if(prob(50))
					to_chat(user, "<span class='red'>You jagged yourself, but you manage to obtain some scrap regardless.</span>")
				else
					to_chat(user, "<span class='red'>You jagged yourself and lost grip on the scrap.</span>")
					return

		var/obj/item/consumable/scrap/S = new /obj/item/consumable/scrap
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
	if(/obj/item/consumable/scrap)
		scrap_health++
		to_chat(user, "You toss the scrap into the pile.")
		playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
		qdel(O)
		if(scrap_health == 1)
			name = "scrapheap"
			desc = "Pile of metal from nowhere. Many pieces look sharp."
			icon_state = "scrap[rand(1,4)]"
