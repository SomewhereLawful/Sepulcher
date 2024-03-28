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
	name = "net line"
	desc = "Nets are tied to the line, enabling the collection of water vermin."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "dragline_empty"
