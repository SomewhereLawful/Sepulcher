// Scrap pile
// Found outside city limits, Bioslaves or proles go and pull parts out
// Risk of lacerating yourself, dependent on position (bioslave (highest) - prole (lowest) //

/obj/item/food/scrap // edible, for fun
	name = "scrap piece"
	desc = "Some broken metal of unknown origin."
	icon_state = "goyslop"

/obj/structure/scrapheap
	name = "scrap heap"
	desc = "Pile of metal from nowhere. Many pieces look sharp."
	icon = 'icons/obj/scrapheaps.dmi'
	icon_state = "scrap1"
	density = TRUE
	anchored = TRUE
	bound_width = 64 // Double wide

/obj/structure/scrapheap/New()
	..()
	icon_state = "scrap[rand(1,4)]"

/obj/structure/scrapheap/attack_hand(mob/user)
	to_chat(user, "You begin to sift through the metal.")
	if(do_after(user, 14.4, target = src))
		new /obj/item/food/scrap(get_turf(user))
		to_chat(user, "You pull some metal from the heap.")
		playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
	..()
