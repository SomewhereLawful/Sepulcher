/obj/structure/barrier // used for border, basically an invisible wall under smoke
	name = "edge of a decaying reality"
	desc = "The veil gasps, breathes. An impenetrable barrier."
	anchored = TRUE
	density = TRUE
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"

/obj/structure/barrier/Initialize(mapload)
	. = ..()
	icon_state = "invis"

/obj/structure/barrier/examine(mob/user)
	..()
	to_chat(user, "<span class='magenta'>The formless wall has holes, pinpoint slips to other sections of this reality.</span>")

// structure pass
/obj/structure/object_pass
	name = "object pass checker"
	desc = "you shouldn't be able to see this"
	anchored = TRUE
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"

	var/list/objects_allowed = list(/obj/,/mob/)
	var/list/objects_disallowed = null

/obj/structure/object_pass/Initialize(mapload)
	. = ..()
	invisibility = INVISIBILITY_ABSTRACT

/obj/structure/object_pass/CanPass(atom/movable/mover, turf/target)
	if(is_type_in_list(mover, objects_disallowed))
		return density
	if(is_type_in_list(mover, objects_allowed))
		return !density

/obj/structure/object_pass/foundry_bucket_rails
	name = "foundry bucket rails"
	desc = "This keeps the steel buckets in place"
	objects_disallowed = list(/obj/structure/foundry/steel_bucket)
