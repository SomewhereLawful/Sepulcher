/obj/item/fishing_rod
	name = "fishing rod"
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_rod"
	var/in_use = FALSE

/obj/item/fishing_rod/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(in_use)
		to_chat(user, "<span class='red'>You are already fishing.</span>")
		return
	in_use = TRUE

	if(istype(target, /obj/structure/fishing_spot))
		if(!do_after(user, rand(10,20) SECONDS, target = target))
			in_use = FALSE
			return
		var/obj/structure/fishing_spot/W = target
		var/chosen_fish = pickweight(W.fish_list)
		new chosen_fish(get_turf(user))
		to_chat(user, "<span class='red'>You have caught something.</span>")
		W.spot_life--

		if(W.spot_life <= 1)
			to_chat(user, "<span class='red'>The fishing spot exhausts, melting back into the water.</span>")
			playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
			qdel(W)

		// FOR FISHING SPOT SPRITES
		// Not the best code, I'm sure
		if(W.spot_life >= 4)
			W.icon_state = "fishing_spot_life_3"
		else if(W.spot_life == 3)
			W.icon_state = "fishing_spot_life_2"
		else if(W.spot_life == 2)
			W.icon_state = "fishing_spot_life_1"

	in_use = FALSE

/obj/structure/fishing_spot
	name = "fishing spot"
	desc = "The red water bubbles, creatures of the deep swirl nearby."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_spot_shadow" // this sprite gives me cancer
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

// Fishing net & 
// Stationary actionable item, passively collects fish and is modified by coven behavior

/obj/structure/fishing_net_line
	name = "net line"
	desc = "Nets are tied to the line, enabling the collection of water vermin."
	icon = 'icons/obj/fishing.dmi'

/obj/item/fishing_net
	name = "fishing net"
	desc = "Binding artifice, connect to a water-bound support to passively collect common fish."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_net"

