// Scrap pile
// Found outside city limits, Bioslaves or proles go and pull parts out
// Risk of lacerating yourself, dependent on position (bioslave (highest) - prole (lowest) //

/obj/item/food/scrap // edible, for fun
	name = "scrap piece"
	desc = "Some broken metal of unknown origin."
	icon_state = "scrap1"
	food_volume = 1
	feed_points = 2
	health_points = -25 // Eating sharp metal hurts you????

/obj/item/food/scrap/New()
	..()
	icon_state = "scrap[rand(1,2)]"

/obj/structure/scrapheap
	name = "scrap heap"
	desc = "Pile of metal from nowhere. Many pieces look sharp."
	icon = 'icons/obj/scrapheaps.dmi'
	icon_state = "scrap1"
	density = TRUE
	anchored = TRUE
	pixel_x = -16

/obj/structure/scrapheap/New()
	..()
	icon_state = "scrap[rand(1,4)]"

/obj/structure/scrapheap/attack_hand(mob/user)
	playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
	to_chat(user, "You begin to sift through the metal.")
	var/mob/living/carbon/human/H = user
	if(do_after(user, 20, target = src))
		if(isbioslave(H) || isvagrant(H)) // Don't kid yourself, vagrant - you're as dumb as a bioslave
			if(prob(30))
				H.bleed_rate = 5
				if(prob(50))
					to_chat(user, "<span class='warning'>You jagged yourself, but you manage to obtain some scrap regardless.</span>")
				else
					to_chat(user, "<span class='warning'>You jagged yourself and lost grip on the scrap.</span>")
					return		
		if(isproletariat(H))
			if(prob(15))
				H.bleed_rate = 5
				if(prob(50))
					to_chat(user, "<span class='warning'>You jagged yourself, but you manage to obtain some scrap regardless.</span>")
				else
					to_chat(user, "<span class='warning'>You jagged yourself and lost grip on the scrap.</span>")
					return

		var/obj/item/food/scrap/S = new /obj/item/food/scrap
		user.put_in_active_hand(S)
		playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
	..()

/obj/structure/scrapheap/attackby(obj/item/O, mob/user, params) // Instead of burning the excess, just put it back
	if(/obj/item/food/scrap)
		to_chat(user, "You toss the scrap into the pile.")
		playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
		qdel(O)
