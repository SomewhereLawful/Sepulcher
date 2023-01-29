// Scrap pile
// Found outside city limits, Bioslaves or proles go and pull parts out
// Risk of lacerating yourself, dependent on position (bioslave (highest) - prole (lowest) //

/obj/item/scrapy_scrap
	name = "scrap heap"
	desc = "Pile of metal from nowhere. Many pieces look sharp."

/obj/structure/scrapheap
	name = "scrap heap"
	desc = "Pile of metal from nowhere. Many pieces look sharp."
	icon_state = "drumfire"
	density = TRUE
	anchored = TRUE
	bound_width = 64 // Double wide

/obj/structure/scrapheap/attack_hand(mob/user)
	if(do_after(user, 14.4, target = src))
		for(var/i in 1 to 3)
		new /obj/item/scrapy_scrap(get_turf(src))
	..()
