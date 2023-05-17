/obj/structure/barrier // used for border, basically an invisible wall under smoke
	name = "edge of a dying reality"
	desc = "The blurred reality gasps, breathes. An impenetrable barrier."
	anchored = TRUE
	density = TRUE
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"

/obj/structure/barrier/Initialize(mapload)
	. = ..()
	icon_state = "invis"

/obj/structure/barrier/examine(mob/user)
	..()
	to_chat(user, "<span class='red'>The formless wall has holes, pinpoint slips to other sections of this reality.</span>")
