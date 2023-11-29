// A place to hang up your lanterns
/obj/structure/lamp_post
	name = "lantern post"
	desc = "A hook for a lantern."
	icon = 'icons/sepulcher/lamp_post.dmi'
	icon_state = "post"
	layer = FLY_LAYER
	var/lantern_having = FALSE

/obj/structure/lamp_post/Initialize()
	. = ..()
	update_brightness()

/obj/structure/lamp_post/proc/update_brightness(mob/user = null)
	if(lantern_having)
		set_light(6,1,"#E9CF48") // Abit more range than a freestanding lantern
	else
		icon_state = initial(icon_state)
		set_light(0)

/obj/structure/lamp_post/attackby(obj/item/L, mob/user, params)
	if(/obj/item/flashlight/lantern)
		to_chat(user, "You set the lantern on the hook.")
		icon_state = "post_lantern"
		qdel(L)
		lantern_having = TRUE
		update_brightness()

/obj/structure/lamp_post/attack_hand(mob/user)
	if(lantern_having == TRUE)
		var/obj/item/flashlight/lantern/L = new /obj/item/flashlight/lantern
		user.put_in_active_hand(L)
		to_chat(user, "You take the lantern off the hook.")
		lantern_having = FALSE
		update_brightness()
	else
		return

/obj/structure/lamp_post/lantern
	lantern_having = TRUE