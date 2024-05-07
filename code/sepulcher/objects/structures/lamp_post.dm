// A place to hang up your lanterns
/obj/structure/lamp_post
	name = "lantern post"
	desc = "A hook for a lantern."
	icon = 'icons/sepulcher/lamp_post.dmi'
	icon_state = "post"
	layer = FLY_LAYER
	var/obj/item/flashlight/lantern/lantern

/obj/structure/lamp_post/Initialize()
	. = ..()
	update_brightness()

/obj/structure/lamp_post/proc/update_brightness(mob/user = null)
	if(lantern)
		icon_state = "post_lantern"
		set_light(6,1,"#E9CF48") // Abit more range than a freestanding lantern
	else
		icon_state = initial(icon_state)
		set_light(0)

/obj/structure/lamp_post/attackby(obj/item/L, mob/user, params)
	if(/obj/item/flashlight/lantern)
		if(!user.transferItemToLoc(L, src))
			return
		lantern = L
		update_brightness()
		to_chat(user, "You set the lantern on the hook.")
		qdel(L)

/obj/structure/lamp_post/attack_hand(mob/user)
	if(lantern)
		user.put_in_hands(lantern)
		lantern = null
		to_chat(user, "You take the lantern off the hook.")
		update_brightness()
	else
		return

//Has lantern at start
/obj/structure/lamp_post/lantern
	lantern = new /obj/item/flashlight/lantern
