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
		to_chat(user, "<span class='warning'>You are already fishing.</span>")
		return
	in_use = TRUE

	if(istype(target, /obj/structure/fishing_spot))
		if(!do_after(user, rand(10,20) SECONDS, target = target))
			in_use = FALSE
			return
		var/obj/structure/fishing_spot/W = target
		var/chosen_fish = pickweight(W.fish_list)
		new chosen_fish(get_turf(user))
		to_chat(user, "<span class='warning'>You have caught something.</span>")
		W.spot_life--

	in_use = FALSE

/obj/structure/fishing_spot
	name = "fishing spot"
	desc = "The red water bubbles, creatures of the deep swirl nearby."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_spot" // this sprite gives me cancer
	anchored = TRUE
	var/spot_life = null
	var/list/fish_list = list(
			/obj/item/consumable/food/fish = 25,
			/obj/item/consumable/food/fish/sturgeon = 25,
			/obj/item/consumable/food/fish/crab = 25,
			/obj/item/consumable/food/fish/lamprey = 25)

/obj/structure/fishing_spot/Initialize()
	spot_life = rand(5,13)
	. = ..()

/obj/structure/fishing_spot/attackby(obj/item/O, mob/user, params) // Instead of burning the excess, just put it back
	if(/obj/item/fishing_rod)
		if(spot_life <= 1)
			to_chat(user, "<span class='warning'>The fishing spot exhausts, melting back into the water.</span>")
			playsound(src, 'sound/effects/junk_rustling.ogg', 50, 0)
			qdel(src)

/obj/structure/fishing_spot/sewer
	name = "fishing spot"
	desc = "The slurry bubbles, the dung-borne swirl nearby."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_spot" // this sprite gives me cancer
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