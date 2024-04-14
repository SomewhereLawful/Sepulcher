// Contents:
// - Fishing Spots + Spawners
// - Draglines

/obj/structure/fishing_spot
	name = "fishing spot"
	desc = "The red water bubbles, creatures of the deep swirl nearby."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_spot_shadow"
	anchored = TRUE
	var/spot_life = null
	var/list/fish_list = list(
			/obj/item/consumable/food/fish = 25,
			/obj/item/consumable/food/fish/sturgeon = 25,
			/obj/item/consumable/food/fish/crab = 25,
			/obj/item/consumable/food/fish/lamprey = 25)

/obj/structure/fishing_spot/Initialize()
	spot_life = rand(2,6)
	dir = pick(2,4,6,8) // Cardinal dirs for sprite variety
	if(spot_life >= 4)
		icon_state = "fishing_spot_life_3"
	else if(spot_life == 3)
		icon_state = "fishing_spot_life_2"
	else if(spot_life == 2)
		icon_state = "fishing_spot_life_1"
	. = ..()

/obj/structure/fishing_spot/attackby(obj/item/O, mob/user, params)
	if(/obj/item/fishing_rod)
		return

/obj/structure/fishing_spot/sewer
	name = "fishing spot"
	desc = "The slurry bubbles, the dung-borne swirl nearby."
	icon = 'icons/obj/fishing.dmi'
	fish_list = list(
		/obj/item/consumable/food/fish/crab = 50,
		/obj/item/consumable/food/fish/axlotl = 40,
		/obj/item/consumable/food/fish/burrower = 10)

/obj/effect/spawner/fishing_spot_random
	name = "fishing spot spawner"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	var/fishing_spot_type = /obj/structure/fishing_spot

/obj/effect/spawner/fishing_spot_random/Initialize(mapload)
	. = ..()
	if(prob(20))
		new fishing_spot_type(get_turf(src))
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/fishing_spot_random/sewer
	fishing_spot_type = /obj/structure/fishing_spot/sewer


// Draglines
/obj/structure/fishing_dragline
	name = "fishing dragline"
	desc = "Nets are tied to the line, enabling the collection of water vermin."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "dragline"
	layer = FLY_LAYER
	anchored = TRUE
	density = FALSE //Switches to TRUE when it has net
	var/obj/item/fishing_net/net

/obj/structure/fishing_dragline/Initialize()
	. = ..()
	update_icon()

/obj/structure/fishing_dragline/update_icon()
	cut_overlays()
	if(net)
		add_overlay("dragline-net")

/obj/structure/fishing_dragline/examine(mob/user)
	..()
	if(net)
		to_chat(user, "<span class='magenta'>A net is tied to the line. You can unbind it with an empty hand.</span>")

/obj/structure/fishing_dragline/attack_hand(mob/user)
	if(net)
		to_chat(user, "You begin to untie the net from the line.")
		if(do_after(user, rand(5,8) SECONDS, target = src))
			user.put_in_active_hand(net)
			net = null
			density = FALSE
			update_icon()

/obj/structure/fishing_dragline/attackby(obj/item/L, mob/user, params)
	if(/obj/item/fishing_net)
		if(!net)
			to_chat(user, "You begin to tie the net to the line.")
			if(do_after(user, rand(10,15) SECONDS, target = src))
				if(!user.transferItemToLoc(L, src))
					return
				net = L
				density = TRUE
				update_icon()
				net.gone_fishin()
		else
			to_chat(user, "The line is already occupied with a net.")
			return